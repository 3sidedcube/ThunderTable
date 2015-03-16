//
//  TSCItemPickerController.m
//  ThunderTable
//
//  Created by Phillip Caudell on 10/06/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import "TSCItemPickerController.h"

@interface TSCItemPickerController ()

@end

@implementation TSCItemPickerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.shouldAllowMultipleSelections) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(handleDone:)];
    } else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(handleCancel:)];
    }
    
    TSCTableSection *section = [TSCTableSection sectionWithTitle:nil footer:nil items:self.items target:self selector:@selector(handleItemSelection:)];
    
    self.dataSource = @[section];
}

#pragma mark Methods

- (void)addItem:(TSCItem *)item
{
    [self willChangeValueForKey:@"items"];
    
    NSMutableArray *items = [NSMutableArray arrayWithArray:self.items];
    [items addObject:item];
    _items = items;
    
    [self didChangeValueForKey:@"items"];
}

- (void)showInViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(TSCItemPickerControllerCompletion)completion
{
    self.completion = completion;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self];
    [viewController presentViewController:navigationController animated:animated completion:nil];
}

- (void)finish
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (self.completion) {
        self.completion(self.selectedItems);
    }
}

- (NSArray *)selectedItems
{
    return [self.items filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"selected == true"]];
}

#pragma mark Actions

- (void)handleDone:(id)sender
{
    [self finish];
}

- (void)handleCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)handleItemSelection:(TSCTableSelection *)selection
{
    TSCItem *item = (TSCItem *)selection.object;
    
    if (self.shouldAllowMultipleSelections) {
        
        item.selected = !item.selected;
        [self.tableView reloadRowsAtIndexPaths:@[selection.indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    } else {
        
        for (TSCItem *item in self.selectedItems) {
            item.selected = NO;
        }
        
        item.selected = YES;
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        self.tableView.userInteractionEnabled = NO;
        [NSTimer scheduledTimerWithTimeInterval:0.45 target:self selector:@selector(finish) userInfo:nil repeats:NO];
    }
}

@end
