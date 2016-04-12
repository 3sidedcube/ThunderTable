//
//  TSCTableSortedSections.h
//  ThunderTable
//
//  Created by Phillip Caudell on 24/02/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableSectionDataSource.h"
@class TSCTableSection;

/**
 The `TSCTableSortedSections` class sorts `TSCTableSection`s into alphabetic order
 */
@interface TSCTableSortedSections : NSMutableArray

///---------------------------------------------------------------------------------------
/// @name Initializing a TSCTableSortedSections Object
///---------------------------------------------------------------------------------------

/**
Returns an array of `TSCTableRow`s sorted in alphabetic order
@param items The array of `TSCTableRow`s or objects that conform to the `TSCTableRowDataSource` protocol to be sorted
@param target The object to send all selection events for rows inside the section
@param selector The selector to call on the `target` when a row is selected
@discussion `target` and `selector` can be set to nil if you wish to add a target to each individual row or object. The row object will be passsed to the method given in the `selector` if `selector` and `target` are specified
*/
+ (NSArray<__kindof NSObject<TSCTableSectionDataSource> *> * _Nonnull)sortedSectionsWithItems:(NSArray * _Nonnull)items target:(id _Nullable)target selector:(SEL _Nullable)selector;

@end
