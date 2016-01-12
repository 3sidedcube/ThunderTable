//
//  TSCTableInputRow.m
// ThunderTable
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputRow.h"

@interface TSCControlTargetActionPair: NSObject

    @property (nonatomic, assign) id target;
    @property (nonatomic, assign) SEL action;

@end

@implementation TSCControlTargetActionPair


@end

@interface TSCTableInputRow ()

@property (nonatomic, strong) NSMutableDictionary <NSNumber *, NSMutableArray <TSCControlTargetActionPair *> *> *targetSelectorDictionary;

@end

@implementation TSCTableInputRow

- (NSMutableDictionary *)targetSelectorDictionary
{
    if (!_targetSelectorDictionary) {
        _targetSelectorDictionary = [NSMutableDictionary new];
    }
    
    return _targetSelectorDictionary;
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)events
{
    if (target && action) {
        
        TSCControlTargetActionPair *pair = [TSCControlTargetActionPair new];
        pair.target = target;
        pair.action = action;
        
        for (int i = 0; i <= 19; i++) {
            
            // Left shift for each int in allowed control event options
            if (events & (1 << i)) {
                [self addTargetPair:pair forControlEvents:(1 << i)];
            }
        }
        
    }
}

- (void)addTargetPair:(TSCControlTargetActionPair *)pair forControlEvents:(UIControlEvents)events
{
    if (pair) {
        
        NSMutableArray *targets = [NSMutableArray new];
        
        if (self.targetSelectorDictionary[@(events)]) {
            targets = self.targetSelectorDictionary[@(events)];
        }
        
        [targets addObject:pair];
        
        self.targetSelectorDictionary[@(events)] = targets;
    }
}

- (void)removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)events
{
    TSCControlTargetActionPair *pair;
    
    if (target) {
        
        pair = [TSCControlTargetActionPair new];
        pair.target = target;
        pair.action = action;
    }
    
    // For each individual control event option
    for (int i = 0; i <= 19; i++) {
        
        // If it's enabled
        if (events & (1 << i)) {
            [self removeTargetPair:pair forControlEvents:(1 << i)];
        }
    }
}

- (void)removeTargetPair:(TSCControlTargetActionPair *)pair forControlEvents:(UIControlEvents)events
{
    if (!pair) { // If haven't provided a specific pair remove all pairs for events
        
        if (self.targetSelectorDictionary[@(events)]) {
            [self.targetSelectorDictionary removeObjectForKey:@(events)];
        }
        
    } else if (self.targetSelectorDictionary[@(events)]) {
        
        NSMutableArray *targetSelectors = self.targetSelectorDictionary[@(events)];
        [targetSelectors filterUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(TSCControlTargetActionPair  * _Nonnull oldPair, NSDictionary<NSString *,id> * _Nullable bindings) {
            
            return oldPair.target != pair.target;
        }]];
    }
}

- (NSArray <TSCControlTargetActionPair *> *)targetPairsForControlEvents:(UIControlEvents)events
{
    NSMutableArray <TSCControlTargetActionPair *> *targetPairs = [NSMutableArray new];
    
    for (int i = 0; i <= 19; i++) {
        
        // Left shift for each int in allowed control event options
        if (events & (1 << i)) {
            
            if (self.targetSelectorDictionary[@(events)]) {
                [targetPairs addObjectsFromArray:self.targetSelectorDictionary[@(events)]];
            }
        }
    }
    
    return targetPairs;
}

- (NSArray *)targetsForControlEvents:(UIControlEvents)events
{
    NSArray *targetPairs = [self targetPairsForControlEvents:events];
    
    if (targetPairs.count > 0) {
        
        NSMutableArray *targets = [NSMutableArray new];
        for (TSCControlTargetActionPair *pair in targetPairs) {
            [targets addObject:pair.target];
        }
        return targets;
        
    } else {
        return nil;
    }
}

- (NSArray *)actionStringsForControlEvents:(UIControlEvents)events
{
    NSArray *targetPairs = [self targetPairsForControlEvents:events];
    
    if (targetPairs.count > 0) {
        
        NSMutableArray *targets = [NSMutableArray new];
        for (TSCControlTargetActionPair *pair in targetPairs) {
            [targets addObject:NSStringFromSelector(pair.action)];
        }
        return targets;
        
    } else {
        return nil;
    }
}

- (void)updateTargetsAndActionsForControl:(UIControl *)control
{
    if (!control || ![control respondsToSelector:@selector(addTarget:action:forControlEvents:)] || ![control respondsToSelector:@selector(removeTarget:action:forControlEvents:)]) {
        return;
    }
    
    [control removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    
    // For each individual control event option
    for (int i = 0; i <= 19; i++) {
        
        UIControlEvents events = (1 << i);
        
        NSArray *targets = [self targetsForControlEvents:events];
        NSArray *selectors = [self actionStringsForControlEvents:events];
        
        if (targets && selectors) {
            
            [targets enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NSString *selectorString = selectors[idx];
                
                [control addTarget:obj action:NSSelectorFromString(selectorString) forControlEvents:events];
            }];
        }
    }
}

- (void)setValue:(id)value
{
    
}

- (void)setValue:(id)value sender:(id)sender
{
    UIControlEvents events = UIControlEventValueChanged;
    
    NSArray *targets = [self targetsForControlEvents:events];
    NSArray *selectors = [self actionStringsForControlEvents:events];
    
    if (targets && selectors) {
        
        [targets enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSString *selectorString = selectors[idx];
            [obj performSelector:NSSelectorFromString(selectorString) withObject:sender];
        }];
    }
}

@end
