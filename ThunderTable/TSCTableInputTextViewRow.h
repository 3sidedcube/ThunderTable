//
//  TSCTableInputTextViewRow.h
//  ThunderStorm
//
//  Created by Matt Cheetham on 17/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"

@interface TSCTableInputTextViewRow : TSCTableInputRow <TSCTableRowDataSource>

@property (nonatomic) CGFloat cellHeight;
@property (nonatomic, strong) NSString *placeholder;

+ (id)rowWithPlaceholder:(NSString *)placeholder inputId:(NSString *)inputId required:(BOOL)required cellHeight:(CGFloat)height;

@end
