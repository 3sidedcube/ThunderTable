//
//  TSCTableInputTextFieldRow.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputRow.h"

@interface TSCTableInputTextFieldRow : TSCTableInputRow <TSCTableRowDataSource>

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic) UIKeyboardType keyboardType;
@property (nonatomic) UIReturnKeyType returnKeyType;
@property (nonatomic) BOOL isSecure;
@property (nonatomic, assign) UITextAutocorrectionType autocorrectionType;
@property (nonatomic, assign) UITextAutocapitalizationType autocapitalizationType;

+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId required:(BOOL)required;
+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId keyboardType:(UIKeyboardType)keyboardType required:(BOOL)required;
+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId returnKeyType:(UIReturnKeyType)returnKeyType required:(BOOL)required;
+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId returnKeyType:(UIReturnKeyType)returnKeyType required:(BOOL)required isSecure:(BOOL)isSecure;

@end
