//
//  TSCTableInputSliderRowDataSource.h
//  ThunderTable
//
//  Created by Matt Cheetham on 03/04/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableInputRowDataSource.h"

@protocol TSCTableInputSliderRowDataSource <TSCTableInputRowDataSource>

- (NSNumber *)maximumValue;
- (NSNumber *)minimumValue;

@end
