//
//  TSCTableSection.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableSectionDataSource.h"

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
+ (id)sectionWithItems:(NSArray *)items;

/**
 Initializes the section with an array of rows
 @param title The text to display in the header of section
 @param footer The text to display in the footer of the section
 @param target The object to send all selection events for rows inside the section
 @param selector The selector to call on the `target` when a row is selected
 @param items The array of `TSCTableRow`s or objects that conform to the `TSCTableRowDataSource` protocol
 @discussion `target` and `selector` can be set to nil if you wish to add a target to each individual row or object. The row object will be passsed to the method given in the `selector` if `selector` and `target` are specified
 */
+ (id)sectionWithTitle:(NSString *)title footer:(NSString *)footer items:(NSArray *)items target:(id)target selector:(SEL)selector;

/**
 @abstract The text to be displayed above the section in the header
 */
@property (nonatomic, strong) NSString *title;

/**
 @abstract The text to be displayed below the section in the footer
 */
@property (nonatomic, strong) NSString *footer;

/**
 @abstract An array of items conforming to the `TSCTableRowDataSource` protocol to be displayed in the section
 */
@property (nonatomic, strong) NSArray *items;

/**
 @abstract The object to send all selection events for rows inside the section
 */
@property (nonatomic, weak) id target;

/**
 @abstract The selector to call on the `target` when a row is selected
 */
@property (nonatomic, assign) SEL selector;

@end
