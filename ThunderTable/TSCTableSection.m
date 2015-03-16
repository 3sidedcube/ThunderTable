//
//  TSCTableSection.m
// ThunderTable
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableSection.h"

@implementation TSCTableSection

+ (id)sectionWithItems:(NSArray *)items
{
    TSCTableSection *section = [[TSCTableSection alloc] init];
    section.items = items;
    
    return section;
}

+ (id)sectionWithTitle:(NSString *)title footer:(NSString *)footer items:(NSArray *)items target:(id)target selector:(SEL)selector
{
    TSCTableSection *section = [[TSCTableSection alloc] init];
    section.title = title;
    section.items = items;
    section.target = target;
    section.selector = selector;
    section.footer = footer;
    
    return section;
}

#pragma mark Section data source

- (NSString *)sectionHeader
{
    return self.title;
}

- (NSString *)sectionFooter
{
    return self.footer;
}

- (id)sectionTarget
{
    return self.target;
}

- (SEL)sectionSelector
{
    return self.selector;
}

- (NSArray *)sectionItems
{
    return self.items;
}

@end
