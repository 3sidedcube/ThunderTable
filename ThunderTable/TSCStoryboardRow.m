//
//  TSCStoryboardRow.m
//  ThunderTable
//
//  Created by Matthew Cheetham on 24/09/2015.
//  Copyright © 2015 threesidedcube. All rights reserved.
//

#import "TSCStoryboardRow.h"

@implementation TSCStoryboardRow

+ (instancetype)rowWithPrototypeIdentifier:(NSString *)identifier
{
    TSCStoryboardRow *row = [self new];
    row.prototypeIdentifier = identifier;
    
    return row;
}

#pragma mark - Table delegate

- (NSString *)rowTitle
{
    return nil;
}

- (NSString *)tableViewPrototypeCellIdentifier
{
    return self.prototypeIdentifier;
}
@end
