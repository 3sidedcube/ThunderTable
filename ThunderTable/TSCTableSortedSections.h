//
//  TSCTableSortedSections.h
//  ThunderTable
//
//  Created by Phillip Caudell on 24/02/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TSCTableSection;

/**
 The `TSCTableSortedSections` class sorts `TSCTableSection`s into alphabetic order
 */
@interface TSCTableSortedSections : NSMutableArray

///---------------------------------------------------------------------------------------
/// @name Initializing a TSCTableSortedSections Object
///---------------------------------------------------------------------------------------

/**
Initializes the array with an array of `TSCTableRows` and sorts them into alphabetic order
@param items The array of `TSCTableRow`s or objects that conform to the `TSCTableRowDataSource` protocol to be sorted
@param target The object to send all selection events for rows inside the section
@param selector The selector to call on the `target` when a row is selected
@discussion `target` and `selector` can be set to nil if you wish to add a target to each individual row or object. The row object will be passsed to the method given in the `selector` if `selector` and `target` are specified
*/
- (NSMutableArray<TSCTableSection *> *)initWithItems:(NSArray *)items target:(id)target selector:(SEL)selector;

/**
Returns an array of `TSCTableRow`s sorted in alphabetic order
@param items The array of `TSCTableRow`s or objects that conform to the `TSCTableRowDataSource` protocol to be sorted
@param target The object to send all selection events for rows inside the section
@param selector The selector to call on the `target` when a row is selected
@discussion `target` and `selector` can be set to nil if you wish to add a target to each individual row or object. The row object will be passsed to the method given in the `selector` if `selector` and `target` are specified
*/
+ (NSMutableArray<TSCTableSection *> *)sortedSectionsWithItems:(NSArray *)items target:(id)target selector:(SEL)selector;

@end
