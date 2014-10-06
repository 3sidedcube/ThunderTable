//
//  TSCTableSelection.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableRowDataSource.h"

@interface TSCTableSelection : NSObject

@property (nonatomic, strong) id <TSCTableRowDataSource> object;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UITableView *tableView;

@end
 