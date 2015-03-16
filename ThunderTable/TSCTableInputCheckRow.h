//
//  TSCTableInputCheckRow.h
//  ThunderStorm
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"

@interface TSCTableInputCheckRow : TSCTableInputRow

+ (instancetype)rowWithTitle:(NSString *)title inputId:(NSString *)inputId required:(BOOL)required;

@end
