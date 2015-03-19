//
//  TSCTableSelection.h
// ThunderTable
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableRowDataSource.h"

/**
 `TSCTableSelection` is the object that gets passed back when a `TSCTableRow` is selected.
 */
@interface TSCTableSelection : NSObject

///---------------------------------------------------------------------------------------
/// @name Initializing a TSCTableSelection Object
///---------------------------------------------------------------------------------------

/**
@abstract The selected object from the table view
*/
@property (nonatomic, strong) id <TSCTableRowDataSource> object;

/**
 @abstract The index path of the selected object
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 @abstract The index path of the selected object
 */
@property (nonatomic, strong) UITableView *tableView;

@end
 