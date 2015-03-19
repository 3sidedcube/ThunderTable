//
//  TSCItemPickerController.h
//  ThunderTable
//
//  Created by Phillip Caudell on 10/06/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableViewController.h"
#import "TSCItem.h" 

/**
 `TSCItemPickerController` class provides a simple way of displaying a list of items, and allowing the user to make selection from those items.
 */
@interface TSCItemPickerController : TSCTableViewController

/**
 A completion block which passes in an array of sected items
 */
typedef void (^TSCItemPickerControllerCompletion)(NSArray *selectedItems);

/**
 @abstract The array of `TSCItem`ss which the user can choose from
 */
@property (nonatomic, strong) NSArray *items;

/**
 @abstract The array of `TSCItem`s which the user has selected
 */
@property (nonatomic, readonly) NSArray *selectedItems;

/**
 @abstract Whether the controller allows selecting multiple items from the provided array of items
 @discussion If set to true the cancel button will be removed and a 'done' button will show as the rightBarButtonItem
 */
@property (nonatomic, assign) BOOL shouldAllowMultipleSelections;

/**
 @abstract The completion block to be fired once the user has made a selection
 @discussion If `shouldAllowMultipleSelections` is set to true this will only be called when the user hits 'done'
 */
@property (nonatomic, strong) TSCItemPickerControllerCompletion completion;

/**
 Adds an item to be displayed in the picker.
 @param item A `TSCItem` to be displayed.
 */
- (void)addItem:(TSCItem *)item;

/**
 Shows the picker in the supplied view controller.
 @param viewController The view controller from which to present from.
 @param animated Whether to the presentation should be animated.
 @param completion The block to be fired once a user has sucessfully made a selection.
 */
- (void)showInViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(TSCItemPickerControllerCompletion)completion;

@end
