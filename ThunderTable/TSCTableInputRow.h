//
//  TSCTableInputRow.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableRow.h"
#import "TSCTableInputRowDataSource.h"

@interface TSCTableInputRow : TSCTableRow <TSCTableInputRowDataSource>

@property (nonatomic, strong) id value;
@property (nonatomic, assign) BOOL required;
@property (nonatomic, strong) NSString *inputId;

@end
