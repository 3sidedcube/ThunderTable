//
//  TSCTableInputTextFieldRow.h
// ThunderTable
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputRow.h"
/**
 A row which provides the user with a `UITextField` for entering data
 */
@interface TSCTableInputTextFieldRow : TSCTableInputRow <TSCTableRowDataSource>

///---------------------------------------------------------------------------------------
/// @name Initialization Methods
///---------------------------------------------------------------------------------------

/**
 Initializes the row with a title and placeholder
 @param title The title to display in the row
 @param placeholder A placeholder string to display in the `UITextField`
 @param inputId The key to save the value of the `UITextField` under
 @param required Whether or not a value is required for this row
 */
+ (instancetype)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId required:(BOOL)required;

/**
 Initializes the row with a title, placeholder and keyboard style
 @param title The title to display in the row
 @param placeholder A placeholder string to display in the `UITextField`
 @param inputId The key to save the value of the `UITextField` under
 @param keyboardType the keyboard type to display when the `UITextField` becomes first responder
 @param required Whether or not a value is required for this row
 */
+ (instancetype)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId keyboardType:(UIKeyboardType)keyboardType required:(BOOL)required;

/**
 Initializes the row with a title, placeholder and return key style
 @param title The title to display in the row
 @param placeholder A placeholder string to display in the `UITextField`
 @param inputId The key to save the value of the `UITextField` under
 @param returnKeyType the return key type to display on the keyboard when the `UITextField` becomes first responder
 @param required Whether or not a value is required for this row
 */
+ (instancetype)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId returnKeyType:(UIReturnKeyType)returnKeyType required:(BOOL)required;

/**
 Initializes the row with a title, placeholder, return key style and optionally secure text input
 @param title The title to display in the row
 @param placeholder A placeholder string to display in the `UITextField`
 @param inputId The key to save the value of the `UITextField` under
 @param returnKeyType the return key type to display on the keyboard when the `UITextField` becomes first responder
 @param required Whether or not a value is required for this row
 @param isSecure Whether the `UITextField` needs to be displayed as a secure input (dots replace characters)
 */
+ (instancetype)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId returnKeyType:(UIReturnKeyType)returnKeyType required:(BOOL)required isSecure:(BOOL)isSecure;

///---------------------------------------------------------------------------------------
/// @name Row configuration
///---------------------------------------------------------------------------------------

/**
 @abstract A placeholder string to be displayed in the `UITextField`
 */
@property (nonatomic, copy) NSString *placeholder;

/**
 @abstract Defines the type of keyboard to be shown when the `UITextField` becomes first responder
 */
@property (nonatomic) UIKeyboardType keyboardType;

/**
 @abstract Defines the return key type of keyboard shown when the UITextField becomes first responder
 */
@property (nonatomic) UIReturnKeyType returnKeyType;

/**
 @abstract Determines whether the UITextField is shown as a secure text field
 */
@property (nonatomic) BOOL isSecure;

/**
 @abstract Determines the autocorrection type of the UITextField
 */
@property (nonatomic, assign) UITextAutocorrectionType autocorrectionType;

/**
 @abstract Determines the autocapitalization type of the UITextField
 */
@property (nonatomic, assign) UITextAutocapitalizationType autocapitalizationType;

@end
