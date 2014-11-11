//
//  TSCTableInputSliderRowDataSource.h
//  ThunderTable
//
//  Created by Matt Cheetham on 03/04/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableInputRowDataSource.h"

/**
 The `TSCTableInputSliderRowDataSource` inhertis the `TSCTableInputRowDataSource` protocol and is specific to slider input types.
 */
@protocol TSCTableInputSliderRowDataSource <TSCTableInputRowDataSource>

///---------------------------------------------------------------------------------------
/// @name General setup
///---------------------------------------------------------------------------------------

/**
 @abstract The maximum value the slider can reach
 */
- (NSNumber *)maximumValue;

/**
 @abstract The minimum value the slider can reach
 */
- (NSNumber *)minimumValue;

@end
