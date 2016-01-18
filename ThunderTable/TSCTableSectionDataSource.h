//
//  TSCTableSectionDataSource.h
// ThunderTable
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSCTableRowDataSource;

/**
 All sections that can be added in a `TSCTableViewController` must conform to the `TSCTableSectionDataSource` protocol. This protocol is for defining what is added to a table section and the table sections common properties
  */
@protocol TSCTableSectionDataSource <NSObject>

///---------------------------------------------------------------------------------------
/// @name General setup
///---------------------------------------------------------------------------------------

/**
 @abstract The items displayed in the section. Items must conform to `TSCTableRowDataSource`.
 */
- (NSArray <id <TSCTableRowDataSource>> * _Nonnull)sectionItems;

/**
 @abstract The header title of the section
 */
- (NSString * _Nullable)sectionHeader;

/**
 @abstract The footer title of the section
 */
- (NSString * _Nullable)sectionFooter;

/**
 @abstract The object to send all selection events for rows inside the section
 */
- (id _Nullable)sectionTarget;

/**
 @abstract The selector to call on the `target` when a row is selected
 */
- (SEL _Nullable)sectionSelector;

@end
