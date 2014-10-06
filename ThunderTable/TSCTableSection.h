//
//  TSCTableSection.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableSectionDataSource.h"

@interface TSCTableSection : NSObject <TSCTableSectionDataSource>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *footer;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;

+ (id)sectionWithItems:(NSArray *)items;
+ (id)sectionWithTitle:(NSString *)title footer:(NSString *)footer items:(NSArray *)items target:(id)target selector:(SEL)selector;

@end
