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
 TSCItemPickerController class provides a simple way of displaying a list of items, and allowing the user to make selection from those items.
 */
@interface TSCItemPickerController : TSCTableViewController

typedef void (^TSCItemPickerControllerCompletion)(NSArray *selectedItems);

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, readonly) NSArray *selectedItems;
@property (nonatomic, assign) BOOL shouldAllowMultipleSelections;
@property (nonatomic, strong) TSCItemPickerControllerCompletion completion;

/**
 Adds an item to be displayed in the picker.
 @param item A TSCItem to be displayed.
 */
- (void)addItem:(TSCItem *)item;

/**
 Shows the picker in the supplied view controller.
 @param viewController The view controller from which to present from.
 @param animated Whether to the presentation should be animated.
 @Param completion The block to be fired once a user has sucessfully made a selection.
 */
- (void)showInViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(TSCItemPickerControllerCompletion)completion;

@end
