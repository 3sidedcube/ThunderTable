//
//  TSCTableViewController.m
//  ThunderTable
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableViewController.h"
#import "TSCTableSection.h"
#import "TSCTableRowDataSource.h"
#import "TSCTableSelection.h"
#import "TSCTableViewCell.h"
#import "TSCTableInputViewCell.h"
#import "TSCTableInputTextFieldViewCell.h"
#import "TSCTableInputTextViewViewCell.h"
#import "TSCTableValue1ViewCell.h"
#import "TSCTableInputCheckViewCell.h"
#import "TSCTableInputDatePickerViewCell.h"
#import "TSCTableInputPickerViewCell.h"
#import "TSCTableRow.h"
#import "GCPlaceholderTextView.h"
#import "TSCCheckView.h"
#import "UIImageView+TSCImageView.h"
#import "TSCThemeManager.h"

@interface TSCTableViewController ()
{
    UIBarButtonItem *TSC_editItem;
    CGRect _keyboardPresentedViewFrame;
    CGRect _standardViewFrame;
    UIEdgeInsets _standardInsets;
    BOOL _isPendingSetDataSource;
    BOOL _didSetupFrame;
    BOOL _viewHasAppearedBefore;
}

@property (nonatomic, strong) NSMutableDictionary *overides;
@property (nonatomic, strong) NSMutableArray *registeredCellClasses;
@property (nonatomic, strong) NSMutableDictionary *dynamicHeightCells;
@property (nonatomic, assign) BOOL viewHasAppeared;

@end

@implementation TSCTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self) {
        
        self.registeredCellClasses = [NSMutableArray array];
        self.dynamicHeightCells = [NSMutableDictionary dictionary];
        self.shouldMakeFirstTextFieldFirstResponder = true;
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
}

#pragma mark View life cycle

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self TSC_resignAnyResponders];
    self.viewHasAppeared = false;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:true];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!_viewHasAppearedBefore && self.shouldMakeFirstTextFieldFirstResponder) {
        [self TSC_makeFirstTextFieldFirstResponder];
        _viewHasAppearedBefore = true;
    }
    
    if (self.title) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TSCStatEventNotification" object:self userInfo:@{@"type":@"screen", @"name":self.title}];
    }
    
    _standardInsets = self.tableView.contentInset;
    self.viewHasAppeared = true;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = true;
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (!_didSetupFrame) {
        _standardViewFrame = self.view.frame;
        
        float keyboardHeight = 216;
        
        _keyboardPresentedViewFrame = CGRectMake(_standardViewFrame.origin.x, _standardViewFrame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height - keyboardHeight);
        _didSetupFrame = true;
    }
}

#pragma mark Actions

- (void)overideCellAtIndexPath:(NSIndexPath *)indexPath withClass:(Class)overideClass
{
    if (!self.overides) {
        self.overides = [NSMutableDictionary dictionary];
    }
    
    self.overides[indexPath] = overideClass;
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    self.tableView.contentInset = _standardInsets;
    self.tableView.scrollIndicatorInsets = _standardInsets;
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    NSDictionary *info = notification.userInfo;
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    if (TSC_isPad()) {
        
        if (self.navigationController.presentingViewController) {
            
            CGRect rect = [self.view convertRect:self.view.frame toView:[UIApplication sharedApplication].keyWindow];
            kbSize = CGSizeMake(kbSize.width, kbSize.height - rect.origin.y - self.tableView.contentOffset.y + 44);
        }
    }
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(_standardInsets.top, 0.0, kbSize.height, 0.0);
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSDictionary *info = notification.userInfo;
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    if (TSC_isPad()) {
        
        if (self.navigationController.presentingViewController) {
            
            CGRect rect = [self.view convertRect:self.view.frame toView:[UIApplication sharedApplication].keyWindow];
            kbSize = CGSizeMake(kbSize.width, kbSize.height - rect.origin.y - self.tableView.contentOffset.y + 44);
        }
    }
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(_standardInsets.top, 0.0, kbSize.height, 0.0);
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
}

#pragma mark Refresh

- (void)setRefreshEnabled:(BOOL)refreshEnabled
{
    _refreshEnabled = refreshEnabled;
    
    if (refreshEnabled) {
        self.refreshControl = [[UIRefreshControl alloc] init];
        [self.refreshControl addTarget:self action:@selector(handleRefresh) forControlEvents:UIControlEventValueChanged];
        [self.tableView addSubview:self.refreshControl];
    } else {
        [self.refreshControl removeFromSuperview];
        self.refreshControl = nil;
    }
}

- (void)handleRefresh
{
    self.dataSource = self.dataSource;
}

- (void)setRefreshing:(BOOL)refreshing
{
    _refreshing = refreshing;
    
    if (!refreshing) {
        [self.refreshControl endRefreshing];
    } else {
        [self.refreshControl beginRefreshing];
    }
}

#pragma mark Datasource

- (void)setDataSource:(NSArray *)dataSource
{
    [self setDataSource:dataSource animated:false];
}

- (void)setDataSource:(NSArray *)dataSource animated:(BOOL)animated
{
    _dataSource = dataSource;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
        
    if (animated) {
        [self.tableView reloadData];
    } else {
        [self.tableView reloadData];
    }
}

- (NSArray *)flattenedDataSource
{
    NSMutableArray *flattenedDataSource = [NSMutableArray array];
    
    for (id <TSCTableSectionDataSource> section in self.dataSource) {
        
        NSArray *items = [section sectionItems];
        [flattenedDataSource addObjectsFromArray:items];
    }
    
    return flattenedDataSource;
}

#pragma mark UITableViewDataSource methods

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    TSCTableSection *tableSection = self.dataSource[section];
    
    return tableSection.sectionHeader;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    TSCTableSection *tableSection = self.dataSource[section];
    
    return tableSection.sectionFooter;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSObject <TSCTableSectionDataSource> *tableSection = self.dataSource[section];
    
    return tableSection.sectionItems.count;
}

- (Class)TSC_tableViewCellClassForIndexPath:(NSIndexPath *)indexPath
{
    NSObject <TSCTableSectionDataSource> *section = self.dataSource[indexPath.section];
    
    NSObject <TSCTableRowDataSource> *row = [section sectionItems][indexPath.row];
    
    Class tableViewCellClass = nil;
    
    if (self.overides[indexPath]) {
        return tableViewCellClass = self.overides[indexPath];
    }
    
    if ([row respondsToSelector:@selector(tableViewCellClass)]) {
        tableViewCellClass = [row tableViewCellClass];
    } else if ([row respondsToSelector:@selector(tableViewPrototypeCellIdentifier)]) {
        tableViewCellClass = [UITableViewCell class];
    } else {
        tableViewCellClass = [TSCTableViewCell class];
    }
    
    return tableViewCellClass;
}

- (NSString *)TSC_tableViewPrototypeCellIdentifierForIndexPath:(NSIndexPath *)indexPath
{
    NSObject <TSCTableSectionDataSource> *section = self.dataSource[indexPath.section];
    
    NSObject <TSCTableRowDataSource> *row = [section sectionItems][indexPath.row];
    
    if ([row respondsToSelector:@selector(tableViewPrototypeCellIdentifier)]) {
        
        return [row tableViewPrototypeCellIdentifier];
    }
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class tableViewCellClass = [self TSC_tableViewCellClassForIndexPath:indexPath];
    NSString *prototypeIdentifier = [self TSC_tableViewPrototypeCellIdentifierForIndexPath:indexPath];
    
    // Check if class is registered with table view
    if (![self TSC_isCellClassRegistered:tableViewCellClass]) {
        [self TSC_registerCellClass:tableViewCellClass];
    }
    
    TSCTableViewCell *cell;
    
    if (prototypeIdentifier) {
        cell = [tableView dequeueReusableCellWithIdentifier:prototypeIdentifier forIndexPath:indexPath];

    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(tableViewCellClass) forIndexPath:indexPath];
    }
    
    [self TSC_configureCell:cell withIndexPath:indexPath];
    
    return cell;
}

- (void)TSC_configureCell:(TSCTableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    
    NSObject <TSCTableSectionDataSource> *section = self.dataSource[indexPath.section];
    NSObject <TSCTableRowDataSource> *row = [section sectionItems][indexPath.row];

    if ([cell respondsToSelector:@selector(currentIndexPath)]) {
        cell.currentIndexPath = indexPath;
    }
    
    UILabel *textLabel = [cell respondsToSelector:@selector(cellTextLabel)] ? cell.cellTextLabel : cell.textLabel;
    UILabel *detailTextLabel = [cell respondsToSelector:@selector(cellDetailTextLabel)] ? cell.cellDetailTextLabel : cell.detailTextLabel;
    
    detailTextLabel.text = nil;
    textLabel.text = nil;
    cell.cellImageView.image = nil;
    
    // Setup basic defaults
    if ([row respondsToSelector:@selector(rowTitleTextColor)]) {
        
        if ([row rowTitleTextColor]) {
            textLabel.textColor = [row rowTitleTextColor];
        } else {
            textLabel.textColor = [[TSCThemeManager sharedTheme] cellTitleColor];
        }
    } else {
        textLabel.textColor = [[TSCThemeManager sharedTheme] cellTitleColor];
    }
    
    if ([row respondsToSelector:@selector(rowDetailTextColor)]) {
        
        if ([row rowDetailTextColor]) {
            detailTextLabel.textColor = [row rowDetailTextColor];
        } else {
            detailTextLabel.textColor = [[TSCThemeManager sharedTheme] cellDetailColor];
        }
    } else {
        detailTextLabel.textColor = [[TSCThemeManager sharedTheme] cellDetailColor];
    }
    
    if ([row respondsToSelector:@selector(rowBackgroundColor)]) {
        
        if ([row rowBackgroundColor]) {
            
            cell.backgroundColor = [row rowBackgroundColor];
            cell.contentView.backgroundColor = [row rowBackgroundColor];
        } else {
            
            cell.backgroundColor = [[TSCThemeManager sharedTheme] cellBackgroundColor];
            cell.contentView.backgroundColor = [[TSCThemeManager sharedTheme] cellBackgroundColor];
        }
    } else {
        
        cell.backgroundColor = [[TSCThemeManager sharedTheme] cellBackgroundColor];
        cell.contentView.backgroundColor = [[TSCThemeManager sharedTheme] cellBackgroundColor];
    }
    
    if ([row respondsToSelector:@selector(cellStyle)]) {
        
        if ([cell respondsToSelector:@selector(setCellStyle:)]) {
            cell.cellStyle = [row cellStyle];
        }
    } else {
        
        if ([cell respondsToSelector:@selector(setCellStyle:)]) {
            cell.cellStyle = UITableViewCellStyleSubtitle;
        }
    }
    
    if ([row respondsToSelector:@selector(rowTitle)]) {
        
        if ([[row rowTitle] isKindOfClass:[NSAttributedString class]]) {
            textLabel.attributedText = (NSAttributedString *)[row rowTitle];
        } else {
            textLabel.text = [row rowTitle];
        }
    }
    
    if ([row respondsToSelector:@selector(rowSubtitle)]) {
        
        if ([[row rowSubtitle] isKindOfClass:[NSAttributedString class]]) {
            detailTextLabel.attributedText = (NSAttributedString *)[row rowSubtitle];
        } else {
            detailTextLabel.text = [row rowSubtitle];
        }
    }
    
    if ([row respondsToSelector:@selector(indentationLevel)]) {
        cell.indentationLevel = [row indentationLevel];
    }
    
    if ([row respondsToSelector:@selector(rowImageURL)]) {
        
        if ([row respondsToSelector:@selector(rowImagePlaceholder)]) {
            [cell.cellImageView setImageURL:[row rowImageURL] placeholderImage:[row rowImagePlaceholder]];
        } else {
            [cell.cellImageView setImageURL:[row rowImageURL] placeholderImage:nil];
        }
    }
    
    if ([row respondsToSelector:@selector(rowImage)]) {
        cell.cellImageView.image = [row rowImage];
    }
    
    if ([self isIndexPathSelectable:indexPath] && ![row isKindOfClass:[TSCTableInputRow class]]) {
        
        NSObject <TSCTableSectionDataSource> *section = self.dataSource[indexPath.section];
        NSObject <TSCTableRowDataSource> *row = [section sectionItems][indexPath.row];
        
        if (![row respondsToSelector:@selector(shouldDisplaySelectionIndicator)] || [row shouldDisplaySelectionIndicator]) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        if (![row respondsToSelector:@selector(shouldDisplaySelectionCell)] || [row shouldDisplaySelectionCell]) {
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        } else {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
    } else {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if ([row conformsToProtocol:@protocol(TSCTableInputRowDataSource)]) {
        
        TSCTableInputRow *inputRow = (TSCTableInputRow *)row;
        TSCTableInputViewCell *inputCell = (TSCTableInputViewCell *)cell;
        
        inputCell.inputRow = inputRow;
        inputCell.delegate = self;
    }
    
    if ([row respondsToSelector:@selector(rowAccessoryType)]) {
        cell.accessoryType = [row rowAccessoryType];
    }
    
    if ([cell respondsToSelector:@selector(parentViewController)]) {

        cell.parentViewController = self;

    }
    
    // So model can perform additional changes if it wants
    if ([row respondsToSelector:@selector(tableViewCell:)]) {
        [row tableViewCell:cell];
    }
    
    if ([row respondsToSelector:@selector(shouldDisplaySeperator)] && ![row shouldDisplaySeperator]) {
        
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            [cell setSeparatorInset:UIEdgeInsetsMake(0, INFINITY, 0, 0)];
        }
        
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsMake(0, INFINITY, 0, 0)];
        }
        
    } else {
        
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            [cell setSeparatorInset:UIEdgeInsetsMake(0, self.tableView.separatorInset.left, 0, 0)];
        }
        
    }
    
    if ([cell respondsToSelector:@selector(setShouldDisplaySeparators:)] && [row respondsToSelector:@selector(shouldDisplaySeperator)]) {
        
        cell.shouldDisplaySeparators = [row shouldDisplaySeperator];
        
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSObject <TSCTableSectionDataSource> *section = self.dataSource[indexPath.section];
    NSObject <TSCTableRowDataSource> *row = [section sectionItems][indexPath.row];
    
    BOOL thunderTableAutoSizing = ![row respondsToSelector:@selector(tableViewPrototypeCellIdentifier)];
    
    if ([row respondsToSelector:@selector(tableViewCellClass)] && [row tableViewCellClass]) {
        
        Class class = [row tableViewCellClass];
        if ([[NSBundle bundleForClass:[row tableViewCellClass]] pathForResource:NSStringFromClass(class) ofType:@"nib"]) {
            thunderTableAutoSizing = [row respondsToSelector:@selector(tableViewCellHeightConstrainedToContentViewSize:tableViewSize:)] || [row respondsToSelector:@selector(tableViewCellHeightConstrainedToSize:)];
        }
    }
    
    if (!thunderTableAutoSizing) {
        return UITableViewAutomaticDimension;
    }
    
    CGSize contentViewSize = CGSizeMake(self.tableView.frame.size.width, MAXFLOAT);
    
    if ([row respondsToSelector:@selector(tableViewCellHeightConstrainedToSize:)]) {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        float height = [row tableViewCellHeightConstrainedToSize:contentViewSize];
        return height;
#pragma clang diagnostic pop
    } else if ([row respondsToSelector:@selector(tableViewCellHeightConstrainedToContentViewSize:tableViewSize:)]) {
        
        float height = [row tableViewCellHeightConstrainedToContentViewSize:contentViewSize tableViewSize:self.tableView.frame.size];
        return height;
    } else {
        
        float height = [self TSC_dynamicCellHeightWithIndexPath:indexPath];
        return height;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSObject <TSCTableSectionDataSource> *section = self.dataSource[indexPath.section];
    NSObject <TSCTableRowDataSource> *row = [section sectionItems][indexPath.row];
    
    if([row respondsToSelector:@selector(tableViewCellEstimatedHeight)]) {
        return [row tableViewCellEstimatedHeight];
    } else {
        return [self tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    
    return UITableViewAutomaticDimension;
}

- (BOOL)TSC_isCellClassRegistered:(Class)class
{
    BOOL isCellClassRegistered = false;
    NSString *queryingClassName = NSStringFromClass(class);
    
    for (NSString *className in self.registeredCellClasses) {
        if ([queryingClassName isEqualToString:className]) {
            isCellClassRegistered = true;
            break;
        }
    }
    
    return isCellClassRegistered;
}

- (void)TSC_registerCellClass:(Class)class
{
    [self.registeredCellClasses addObject:NSStringFromClass(class)];
    
    if ([[NSBundle bundleForClass:class] pathForResource:NSStringFromClass(class) ofType:@"nib"]) {
        
        UINib *cellNib = [UINib nibWithNibName:NSStringFromClass(class) bundle:[NSBundle bundleForClass:class]];
        
        [self.tableView registerNib:cellNib forCellReuseIdentifier:NSStringFromClass(class)];
        
    } else {
        
        [self.tableView registerClass:class forCellReuseIdentifier:NSStringFromClass(class)];
        
    }
}

#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        TSCTableSection *seciton = (TSCTableSection *)self.dataSource[indexPath.section];
        NSMutableArray *items = seciton.items.mutableCopy;
        
        [items removeObjectAtIndex:indexPath.row];
        seciton.items = [NSArray arrayWithArray:items];
        
        _dataSource = self.dataSource;
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self isIndexPathSelectable:indexPath]) {
        
        [self TSC_handleTableViewSelectionWithIndexPath:indexPath];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (self.shouldDisplayAlphabeticalSectionIndexTitles) {
        return [[UILocalizedIndexedCollation currentCollation] sectionTitles];
    } else {
        return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}

- (BOOL)isIndexPathSelectable:(NSIndexPath *)indexPath
{
    NSObject <TSCTableSectionDataSource> *section = self.dataSource[indexPath.section];
    NSObject <TSCTableRowDataSource> *row = [section sectionItems][indexPath.row];
    
    if ([row respondsToSelector:@selector(rowSelectionSelector)] && [row respondsToSelector:@selector(rowSelectionTarget)]) {
        
        if ((row.rowSelectionSelector && row.rowSelectionTarget) || [row conformsToProtocol:@protocol(TSCTableInputRowDataSource)]) {
            
            return true;
        }
    }
    
    if ([section respondsToSelector:@selector(sectionTarget)] && [section respondsToSelector:@selector(sectionSelector)]) {
        
        if (section.sectionSelector && section.sectionTarget) {
            
            return true;
        }
    }
    
    return false;
}

- (void)TSC_handleTableViewSelectionWithIndexPath:(NSIndexPath *)indexPath
{
    TSCTableSection *section = self.dataSource[indexPath.section];
    NSObject <TSCTableRowDataSource> *row = section.sectionItems[indexPath.row];
    
    TSCTableSelection *selection = [[TSCTableSelection alloc] init];
    selection.indexPath = indexPath;
    selection.object = row;
    selection.tableView = self.tableView;
    
    self.selectedIndexPath = indexPath;
    
    // If row has selector and target assigned, it takes priority over the section's
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if (([row respondsToSelector:@selector(rowSelectionTarget)] && [row respondsToSelector:@selector(rowSelectionSelector)]) && (row.rowSelectionTarget && row.rowSelectionSelector)) {
        [row.rowSelectionTarget performSelector:row.rowSelectionSelector withObject:selection];
    } else {
        
        if ([section respondsToSelector:@selector(sectionTarget)] && [section respondsToSelector:@selector(sectionSelector)]) {
            [[section sectionTarget] performSelector:[section sectionSelector] withObject:selection];
        } else {
            [section.target performSelector:section.selector withObject:selection];
        }
    }
#pragma clang diagnostic pop
    
    // If row is an input
    if ([row conformsToProtocol:@protocol(TSCTableInputRowDataSource)]) {
        
        TSCTableInputViewCell *cell = (TSCTableInputViewCell *)[self.tableView cellForRowAtIndexPath:selection.indexPath];
        
        if ([cell isKindOfClass:[TSCTableInputCheckViewCell class]]) {
            
            TSCTableInputCheckViewCell *checkCell = (TSCTableInputCheckViewCell *)cell;
            TSCCheckView *checkView = checkCell.checkView;
            [checkView setOn:!checkView.isOn animated:true];
        } else {
            [self TSC_resignAnyResponders];
        }
        
        if ([cell isKindOfClass:[TSCTableInputTextFieldViewCell class]]) {
            
            [cell setEditing:true animated:true];
            [[(TSCTableInputTextFieldViewCell *)cell textField] becomeFirstResponder];
        }
        
        if ([cell isKindOfClass:[TSCTableInputTextViewViewCell class]]) {
            
            [cell setEditing:true animated:true];
            [[(TSCTableInputTextViewViewCell *)cell textView] becomeFirstResponder];
        }
        
        if ([cell isKindOfClass:[TSCTableInputDatePickerViewCell class]] || [cell isKindOfClass:[TSCTableInputPickerViewCell class]]) {
            
            [cell setEditing:true animated:true];
            [[(TSCTableInputPickerViewCell *)cell inputView] becomeFirstResponder];
        }
        
        if ([cell respondsToSelector:@selector(setEditing:animated:)]) {
            
            [cell setEditing:true animated:true];
            if ([cell respondsToSelector:@selector(becomeFirstResponder)]) {
                [cell becomeFirstResponder];
            }
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:false];
        }
    }
    
    if ([row respondsToSelector:@selector(shouldRemainSelected)]) {
        if (![row shouldRemainSelected]) {
            [self.tableView deselectRowAtIndexPath:self.selectedIndexPath animated:true];
        }
    } else {
        [self.tableView deselectRowAtIndexPath:self.selectedIndexPath animated:true];
    }
}

- (UITableViewCell *)TSC_dequeueDynamicHeightCellProxyWithIndexPath:(NSIndexPath *)indexPath
{
    Class tableViewCellClass = [self TSC_tableViewCellClassForIndexPath:indexPath];
    
    NSString *classNameString = NSStringFromClass(tableViewCellClass);
    
    UITableViewCell *cell = self.dynamicHeightCells[classNameString];
    
    if (!cell) {
        
        cell = [[tableViewCellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:classNameString];
        self.dynamicHeightCells[classNameString] = cell;
    }
    
    return cell;
}

- (void)TSC_resignAnyResponders
{
    TSCTableInputViewCell *cell = (TSCTableInputViewCell *)[self.tableView cellForRowAtIndexPath:self.selectedIndexPath];
    [cell setEditing:false animated:true];
}

- (BOOL)TSC_isPickerRow:(TSCTableInputRow *)row
{
    if ([row isKindOfClass:[TSCTableInputPickerRow class]] || [row isKindOfClass:[TSCTableInputDatePickerRow class]]) {
        return true;
    } else {
        return false;
    }
}

- (BOOL)TSC_isControlRow:(TSCTableInputRow *)row
{
    return false;
}

- (CGFloat)_contentRightInsetForAccessoryType:(UITableViewCellAccessoryType)accessoryType
{
    switch (accessoryType) {
            
        case UITableViewCellAccessoryNone:
            return 0.0;
            break;
        case UITableViewCellAccessoryDisclosureIndicator:
        case UITableViewCellAccessoryDetailDisclosureButton:
        case UITableViewCellAccessoryCheckmark:
        case UITableViewCellAccessoryDetailButton:
            return 4.0;
            break;
        default:
            break;
    }
    
    return 0.0;
}

- (CGFloat)TSC_dynamicCellHeightWithIndexPath:(NSIndexPath *)indexPath
{
    TSCTableViewCell *cell = (TSCTableViewCell *)[self TSC_dequeueDynamicHeightCellProxyWithIndexPath:indexPath];
    
    [self TSC_configureCell:cell withIndexPath:indexPath];
    cell.frame = CGRectMake(0, 0, self.view.bounds.size.width - (MAX(2.0,[UIScreen mainScreen].scale) * [self _contentRightInsetForAccessoryType:cell.accessoryType]), 44);
    
    [cell layoutSubviews];
    
    CGFloat totalHeight = 0;
    
    NSArray *subviews = cell.contentView.subviews;
    CGFloat lowestYValue = 0;
    
    UIView *highestView;
    UIView *lowestView;
    
    for (UIView *view in subviews) {
        
        if (CGRectGetMaxY(view.frame) > totalHeight) {
            
            totalHeight = CGRectGetMaxY(view.frame);
            highestView = view;
        }
        
        if (view.frame.origin.y < lowestYValue) {
            
            lowestYValue = view.frame.origin.y;
            lowestView = view;
        }
    }
    
    CGFloat cellHeight = totalHeight + fabs(lowestYValue) + 8;
    
    NSObject <TSCTableSectionDataSource> *section = self.dataSource[indexPath.section];
    NSObject <TSCTableRowDataSource> *row = [section sectionItems][indexPath.row];
    
    if ([row respondsToSelector:@selector(rowPadding)]) {
        cellHeight = (cellHeight - 8) + (long)[row rowPadding];
    }
    
    cellHeight = ceilf(cellHeight);
    
    return cellHeight;
}

#pragma mark Editing

- (UIBarButtonItem *)editButtonItem
{
    if (!TSC_editItem) {
        TSC_editItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(TSC_handleEdit:)];
    }
    
    return TSC_editItem;
}

- (UIBarButtonItem *)editDoneButtonItem
{
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(TSC_handleEdit:)];
}

- (void)setEditing:(BOOL)editing
{
    [super setEditing:editing];
    [self.tableView setEditing:editing];
}

- (void)TSC_handleEdit:(id)sender
{
    [self.tableView setEditing:!self.tableView.isEditing animated:true];
    
    if (self.tableView.isEditing) {
        self.navigationItem.rightBarButtonItem = [self editDoneButtonItem];
    } else {
        self.navigationItem.rightBarButtonItem = [self editButtonItem];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    TSCTableSection *section = self.dataSource[indexPath.section];
    NSArray *sectionItems = [section sectionItems];
    NSObject <TSCTableRowDataSource> *row = sectionItems[indexPath.row];
    
    BOOL canEditRow = false;
    
    if ([row respondsToSelector:@selector(canEditRow)]) {
        canEditRow = [row canEditRow];
    }
    
    return canEditRow;
}

#pragma mark Inputs

- (void)TSC_makeFirstTextFieldFirstResponder
{
    if (self.dataSource.count > 0) {
        
        TSCTableSection *section = self.dataSource[0];
        
        if (section.sectionItems.count > 0) {
            
            for (TSCTableInputRow *row in section.sectionItems) {
                
                if ([row isKindOfClass:[TSCTableInputTextFieldRow class]]) {
                    
                    NSInteger index = [section.sectionItems indexOfObject:row];
                    [self TSC_handleTableViewSelectionWithIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
                    
                    break;
                }
            }
        }
    }
}

- (NSArray *)TSC_inputs
{
    NSMutableArray *inputs = [NSMutableArray array];
    
    for (TSCTableSection *section in self.dataSource) {
        
        for (TSCTableInputRow *row in [section sectionItems]) {
            if ([row conformsToProtocol:@protocol(TSCTableInputRowDataSource)]) {
                [inputs addObject:row];
            }
        }
    }
    
    return inputs;
}

- (NSDictionary *)inputDictionary
{
    NSMutableDictionary *inputDictionary = [NSMutableDictionary dictionary];
    
    for (TSCTableInputRow *row in [self TSC_inputs]) {
        
        if (!row.inputId) {
            
        } else {
            
            if (row.value) {
                [inputDictionary setObject:row.value forKey:row.inputId];
            } else {
                [inputDictionary setObject:[NSNull null] forKey:row.inputId];
            }
        }
    }
    
    return inputDictionary;
}

- (void)setInputDictionary:(NSDictionary *)inputDictionary
{
    for (TSCTableInputRow *row in [self TSC_inputs]) {
        
        row.value = inputDictionary[row.inputId];
    }
}

- (NSArray *)missingRequiredInputRows
{
    NSMutableArray *rows = [NSMutableArray array];
    
    [self enumerateInputRowsUsingBlock:^(TSCTableInputRow *inputRow, NSInteger index, NSIndexPath *indexPath, BOOL *stop) {
        
        if (inputRow.required) {
            
            if (inputRow.value == nil || [inputRow.value isEqual:[NSNull null]] || [inputRow.value isKindOfClass:[NSString class]]) {
                
                if ([inputRow.value isKindOfClass:[NSString class]]) {
                    
                    if ([[inputRow.value stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""]) {
                        [rows addObject:inputRow];
                    }
                } else {
                    [rows addObject:inputRow];
                }
            }
        }
    }];
    
    return rows;
}

- (BOOL)isMissingRequiredInputRows
{
    if (self.missingRequiredInputRows.count == 0) {
        return false;
    } else {
        return true;
    }
}

- (void)presentMissingRequiredInputRowsWarning
{
    NSMutableString *requiredFieldNames = [NSMutableString string];
    NSArray *missingRequiredInputRows = self.missingRequiredInputRows;
    
    [missingRequiredInputRows enumerateObjectsUsingBlock:^(TSCTableInputRow *row, NSUInteger index, BOOL *stop) {
        
        if (missingRequiredInputRows.count == 1) {
            [requiredFieldNames appendFormat:@"%@.", row.title];
        } else if (index >= missingRequiredInputRows.count - 1) {
            [requiredFieldNames appendFormat:@"and %@.", row.title];
        } else {
            [requiredFieldNames appendFormat:@"%@, ", row.title];
        }
    }];
    
    UIAlertView *missingRows = [[UIAlertView alloc] initWithTitle:@"Missing information" message:@"Please complete all the required fields." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [missingRows show];
}

- (void)enumerateRowsUsingBlock:(void (^)(TSCTableRow *row, NSInteger index, NSIndexPath *indexPath, BOOL *stop))block
{
    __block NSInteger index = 0;
    [self.dataSource enumerateObjectsUsingBlock:^(TSCTableSection *section, NSUInteger sectionIndex, BOOL *stopSection) {
        
        [section.items enumerateObjectsUsingBlock:^(TSCTableRow *row, NSUInteger rowIndex, BOOL *stopRow) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex];
            block(row, index, indexPath, stopRow);
            *stopSection = * stopRow;
            index++;
            
        }];
    }];
}

- (void)enumerateInputRowsUsingBlock:(void (^)(TSCTableInputRow *inputRow, NSInteger index, NSIndexPath *indexPath, BOOL *stop))block
{
    [self enumerateRowsUsingBlock:^(TSCTableRow *row, NSInteger index, NSIndexPath *indexPath, BOOL *stop) {
        if ([row isKindOfClass:[TSCTableInputRow class]]) {
            block((TSCTableInputRow *)row, index, indexPath, stop);
        }
    }];
}

#pragma mark Table view cell input delegate

- (void)tableInputViewCellDidFinish:(TSCTableViewCell *)cell
{
    __block NSInteger selectedRowIndex = -1;
    
    if ([cell isKindOfClass:[TSCTableInputTextFieldViewCell class]]) {
        [self textFieldDidReturn:[(TSCTableInputTextFieldViewCell *)cell textField]];
    }
    
    [self enumerateInputRowsUsingBlock:^(TSCTableInputRow *inputRow, NSInteger index, NSIndexPath *indexPath, BOOL *stop) {
        
        if ([indexPath isEqual:self.selectedIndexPath]) {
            selectedRowIndex = index;
        }
        
        if (selectedRowIndex == -1) {
            return;
        }
        
        if (index > selectedRowIndex) {
            [self TSC_handleTableViewSelectionWithIndexPath:indexPath];
            *stop = true;
        }
    }];
}

#pragma mark - UITextField delegate

- (void)textFieldDidReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
}

@end
