//
//  TSCTableViewController.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableRowDataSource.h"
#import "TSCTableInputRowDataSource.h"
#import "TSCTableInputSliderRowDataSource.h"
#import "TSCTableSection.h"
#import "TSCTableRow.h"
#import "TSCTableSelection.h"
#import "TSCTableInputRow.h"
#import "TSCTableInputCheckRow.h"
#import "TSCTableInputTextFieldRow.h"
#import "TSCTableInputTextViewRow.h"
#import "TSCTableInputSwitchRow.h"
#import "TSCTableInputPickerRow.h"
#import "TSCTableInputDatePickerRow.h"
#import "TSCTableImageRow.h"
#import "TSCTableValue1Row.h"
#import "TSCTableInputViewCell.h"

@class TSCTableSection;

@interface TSCTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, TSCTableInputViewCellDelegate, UITextFieldDelegate>

// Datasource
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSArray *flattenedDataSource;

// Table View
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) UITableViewStyle style;
@property (nonatomic, strong) NSMutableArray *registeredCellClasses;
@property (nonatomic, strong) NSMutableDictionary *dynamicHeightCells;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;
@property (nonatomic, assign) BOOL shouldDisplayAlphabeticalSectionIndexTitles;
@property (nonatomic, assign) BOOL shouldDisplaySeparatorsOnCells;

// Refresh
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, assign, getter = isRefreshEnabled) BOOL refreshEnabled;
@property (nonatomic, assign, getter = isRefreshing) BOOL refreshing;

// Edit
@property (nonatomic, strong) UIBarButtonItem *editItem;

// Inputs
@property (nonatomic, strong) NSDictionary *inputDictionary;
@property (nonatomic, strong) NSArray *missingRequiredInputRows;
@property (nonatomic, assign) BOOL isMissingRequiredInputRows;

// Overrides
@property (nonatomic, assign) BOOL shouldMakeFirstTextFieldFirstResponder;

- (void)presentMissingRequiredInputRowsWarning;

- (id)initWithStyle:(UITableViewStyle)style;
- (void)setDataSource:(NSArray *)dataSource animated:(BOOL)animated;
- (void)handleRefresh;
- (void)enumerateRowsUsingBlock:(void (^)(TSCTableRow *row, NSInteger index, NSIndexPath *indexPath, BOOL *stop))block;
- (void)enumerateInputRowsUsingBlock:(void (^)(TSCTableInputRow *inputRow, NSInteger index, NSIndexPath *indexPath, BOOL *stop))block;
- (BOOL)TSC_isIndexPathSelectable:(NSIndexPath *)indexPath;
- (void)TSC_handleTableViewSelectionWithIndexPath:(NSIndexPath *)indexPath;
- (void)textFieldDidReturn:(UITextField *)textField;
- (void)overideCellAtIndexPath:(NSIndexPath *)indexPath withClass:(Class)overideClass;

@end
