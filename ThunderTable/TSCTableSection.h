//
//  TSCTableSection.h
// ThunderTable
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableSectionDataSource.h"

@protocol TSCTableRowDataSource;

/**
 `TSCTableSection` is the primary class for creating sections within a `TSCTableViewController`. Sections are added to the dataSource of a TSCTableViewController to create the view
 */
@interface TSCTableSection : NSObject <TSCTableSectionDataSource>

///---------------------------------------------------------------------------------------
/// @name Initializing a TSCTableSection Object
///---------------------------------------------------------------------------------------

/**
 Initializes the section with an array of rows
 @param items The array of `TSCTableRow`s or objects that conform to the `TSCTableRowDataSource` protocol
 */
+ (instancetype _Nonnull)sectionWithItems:(NSArray <id <TSCTableRowDataSource>> * _Nonnull)items;

/**
 Initializes the section with an array of rows
 @param title The text to display in the header of section
 @param footer The text to display in the footer of the section
 @param target The object to send all selection events for rows inside the section
 @param selector The selector to call on the `target` when a row is selected
 @param items The array of `TSCTableRow`s or objects that conform to the `TSCTableRowDataSource` protocol
 @discussion `target` and `selector` can be set to nil if you wish to add a target to each individual row or object. The row object will be passsed to the method given in the `selector` if `selector` and `target` are specified
 */
+ (instancetype _Nonnull)sectionWithTitle:(NSString * _Nullable)title footer:(NSString * _Nullable)footer items:(NSArray <id <TSCTableRowDataSource>>  * _Nonnull)items target:(id _Nullable)target selector:(SEL _Nullable)selector;

/**
 @abstract The text to be displayed above the section in the header
 */
@property (nonatomic, copy) NSString  * _Nullable title;

/**
 @abstract The text to be displayed below the section in the footer
 */
@property (nonatomic, copy) NSString * _Nullable footer;

/**
 @abstract An array of items conforming to the `TSCTableRowDataSource` protocol to be displayed in the section
 */
@property (nonatomic, strong) NSArray * _Nonnull items;

/**
 @abstract The object to send all selection events for rows inside the section
 */
@property (nonatomic, weak) id _Nullable target;

/**
 @abstract The selector to call on the `target` when a row is selected
 */
@property (nonatomic, assign) SEL _Nullable selector;

@end
