//
//  TSCTableSectionDataSource.h
//  ThunderStorm
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSCTableSectionDataSource <NSObject>

- (NSArray *)sectionItems;
- (NSString *)sectionHeader;
- (NSString *)sectionFooter;
- (id)sectionTarget;
- (SEL)sectionSelector;

@end
