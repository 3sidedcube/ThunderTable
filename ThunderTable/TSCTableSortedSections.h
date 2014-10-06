//
//  TSCTableSortedSections.h
//  ThunderTable
//
//  Created by Phillip Caudell on 24/02/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSCTableSortedSections : NSMutableArray

- (id)initWithItems:(NSArray *)items target:(id)target selector:(SEL)selector;
+ (id)sortedSectionsWithItems:(NSArray *)items target:(id)target selector:(SEL)selector;

@end
