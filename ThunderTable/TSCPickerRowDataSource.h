//
//  TSCPickerRowDataSource.h
//  ThunderTable
//
//  Created by Joel Trew on 03/06/2015.
//  Copyright (c) 2015 3 SIDED CUBE. All rights reserved.
//

/** 
 A protocol which enables an object to be shown within a column of the `UIPicker` of a `TSCTableInputPickerRow`
 */
@protocol TSCPickerRowDataSource <NSObject>

/**
 The title which should be displayed for the object in the `UIPicker`
 */
-(NSString *)rowTitle;

@end