//
//  TSCTableSortedSections.m
//  ThunderTable
//
//  Created by Phillip Caudell on 24/02/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableSortedSections.h"
#import "TSCTableRowDataSource.h"
#import "TSCTableSection.h"

@implementation TSCTableSortedSections

+ (NSArray<__kindof NSObject<TSCTableSectionDataSource> *> * _Nonnull)sortedSectionsWithItems:(NSArray * _Nonnull)items target:(id _Nullable)target selector:(SEL _Nullable)selector
{
    NSDictionary *sortedDictionary = [self alphabeticallySortedRowItems:items];
    NSArray *sectionTitles = [sortedDictionary.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSMutableArray<__kindof NSObject <TSCTableSectionDataSource> *> *sections = [NSMutableArray array];
    
    for (NSString *sectionTitle in sectionTitles) {
        
        NSMutableArray *artists = sortedDictionary[sectionTitle];
        
        if (artists) {
            
            TSCTableSection *section = [TSCTableSection sectionWithTitle:sectionTitle footer:nil items:artists target:target selector:selector];
            [sections addObject:section];
        }
    }
    
    return sections;
}

#pragma mark - Helpers

+ (NSDictionary *)alphabeticallySortedRowItems:(NSArray *)items
{
    NSMutableDictionary *sortedDictionary = [NSMutableDictionary dictionary];
    
    for (id <TSCTableRowDataSource> item in items) {
        
        NSString *firstLetter = [[[item rowTitle] substringToIndex:1] uppercaseString];
        
        if (firstLetter) {
            
            NSMutableArray *subItems = sortedDictionary[firstLetter] ? : [NSMutableArray new];
            [subItems addObject:item];
            sortedDictionary[firstLetter] = subItems;
        }
    }
    
    return sortedDictionary;
}

@end
