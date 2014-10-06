//
//  TSCTableInputSliderRow.h
//  ThunderTable
//
//  Created by Sam Houghton on 11/03/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"
#import "TSCTableInputSliderRowDataSource.h"

@class TSCTableInputSliderRow;

@interface TSCTableInputSliderRow : TSCTableInputRow <TSCTableInputSliderRowDataSource>

+ (id)rowWithTitle:(NSString *)title inputId:(NSString *)inputId minValue:(NSNumber *)minValue maxValue:(NSNumber *)maxValue currentValue:(NSNumber *)currentValue required:(BOOL)required;

@end
