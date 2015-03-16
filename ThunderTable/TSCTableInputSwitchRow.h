//
//  TSCTableInputSwitchRow.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 27/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputRow.h"

@class TSCTableInputSwitchRow;

@protocol TSCTableInputSwitchRowDelegate <NSObject>

- (void)inputSwitchRow:(TSCTableInputSwitchRow *)row didChangeToState:(BOOL)newState;

@end

@interface TSCTableInputSwitchRow : TSCTableInputRow <TSCTableRowDataSource>

@property (nonatomic, assign, getter = isOn) BOOL on;
@property (nonatomic, weak) id <TSCTableInputSwitchRowDelegate> delegate;

+ (instancetype)rowWithTitle:(NSString *)title inputId:(NSString *)inputId required:(BOOL)required;
+ (instancetype)rowWithTitle:(NSString *)title image:(UIImage *)image inputId:(NSString *)inputId required:(BOOL)required;

@end
