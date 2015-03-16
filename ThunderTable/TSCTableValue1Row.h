//
//  TSCTableValue1Row.h
// ThunderTable
//
//  Created by Matt Cheetham on 18/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableRowDataSource.h"

/**
 A subclass of `TSCTableRow` which is primarily used to get a row with a UITableViewCellStyleValue1 cell style
 */
@interface TSCTableValue1Row : NSObject <TSCTableRowDataSource>

///---------------------------------------------------------------------------------------
/// @name Initializing a TSCTableValue1Row Object
///---------------------------------------------------------------------------------------

/**
 Initializes the row with a single title.
 @param title The title to display in the row
 @discussion The title will populate the `textLabel` text property of a `UITableViewCell`
 */
+ (id)rowWithTitle:(NSString *)title;

/**
 Initializes the row with a single title.
 @param title The title to display in the row
 @param subtitle The subtitle to display next to the title in the row
 @param image The image to be displayed to the left hand side of the cell
 @discussion The title will populate the `textLabel` text property and the subtitle will populate the `detailTextLabel` text property of the `UITableViewCell`
 */
+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image;

/**
 Initializes the row with a single title in a custom color
 @param title The title to display in the row
 @param subtitle The subtitle to display next to the title in the row
 @param image The image to be displayed to the left hand side of the cell
 @param color A 'UIColor' to color the detail text with
 @discussion The title will populate the `textLabel` text property of a `UITableViewCell`. The detailTextColor will be applied to the detail label text.
 */
+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image detailTextColor:(UIColor *)color;
/**
 Initializes the row with a single title in a custom color
 @param title The title to display in the row
 @param subtitle The subtitle to display next to the title in the row
 @param image The image to be displayed to the left hand side of the cell
 @param color A 'UIColor' to color the detail text with
 @param isBold A boolean which determines whether the textLabel should have a bold font
 @discussion The title will populate the `textLabel` text property of a `UITableViewCell`. The detailTextColor will be applied to the detail label text.
 */
+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image detailTextColor:(UIColor *)color boldLabel:(BOOL)isBold;

/**
 Initializes the row with a single title.
 @param title The title to display in the row
 @param subtitle The subtitle to display beneath the title in row
 @param imageURL The URL of the image to be displayed to the left hand side of the cell. Loaded asynchronously
 @discussion The title will populate the `textLabel` text property and the subtitle will populate the `detailTextLabel` text property of the `UITableViewCell`
 @note Please set the `imagePlaceholder` property when using this method. This is required because the image width and height is used at layout to provide appropriate space for your loaded image.
 */
+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle imageURL:(NSURL *)imageURL;

///---------------------------------------------------------------------------------------
/// @name Handling selection
///---------------------------------------------------------------------------------------

/**
 Adds a target and selector to the cell. This makes the row selectable.
 @param target The object to send the selection event to
 @param selector The selector to call on the target object
 @discussion Calling this method makes the cell selectable in the table view, also adding a selection indicator to the cell
 */
- (void)addTarget:(id)target selector:(SEL)selector;

/**
 @abstract The object to be called upon the user selecting the row
 */
@property (nonatomic, weak) id target;

/**
 @abstract The selector to be called on the target upon the user selecting the row
 */
@property (nonatomic, assign) SEL selector;

///---------------------------------------------------------------------------------------
/// @name Row configuration
///---------------------------------------------------------------------------------------

/**
 @abstract The text to be displayed in the cells `textLabel`
 */
@property (nonatomic, copy) NSString *title;

/**
 @abstract The text to be displayed in the cells `detailTextLabel`
 */
@property (nonatomic, copy) NSString *subtitle;

/**
 @abstract The `UIImage` to be displayed in the cell
 */
@property (nonatomic, strong) UIImage *image;

/**
 @abstract The URL of the image to be loaded into the image area of the cell
 */
@property (nonatomic, strong) NSURL *imageURL;

/**
 @abstract The colour of the detailTextLabel font
 */
@property (nonatomic, strong) UIColor *detailTextColor;

/**
 @abstract Whether the row is enabled or not
 @discussion This determines styling on the row. If it is set to false the text colour for this row will be set to `[[TSCThemeManager sharedTheme] disabledCellTextColor]` otherwise it will display as normal
 */
@property (nonatomic) BOOL enabled;

/**
 @abstract Whether the text on this row should be bolded or not.
 */
@property (nonatomic) BOOL isBold;

/**
 @abstract The link that a row should attempt to push when selected
 */
@property (nonatomic, strong) TSCLink *link;

@end
