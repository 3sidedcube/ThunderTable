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

+ (id)sortedSectionsWithItems:(NSArray *)items target:(id)target selector:(SEL)selector
{
    TSCTableSortedSections *sections = [[TSCTableSortedSections alloc] initWithItems:items target:target selector:selector];
    
    return sections;
}

- (id)initWithItems:(NSArray *)items target:(id)target selector:(SEL)selector
{
    NSArray *sectionTitles = [[UILocalizedIndexedCollation currentCollation] sectionTitles];
    NSDictionary *artistDictionary = [self alphabeticallySortedRowItems:items];
    NSMutableArray *sections = [NSMutableArray array];
    
    for (NSString *sectionTitle in sectionTitles) {
        
        NSMutableArray *artists = artistDictionary[sectionTitle];
        
        if (artists) {
            
            TSCTableSection *section = [TSCTableSection sectionWithTitle:sectionTitle footer:nil items:artists target:target selector:selector];
            [sections addObject:section];
        }
    }
    
    self = (TSCTableSortedSections *)sections;
    
    return self;
}

#pragma mark - Helpers

- (NSDictionary *)alphabeticallySortedRowItems:(NSArray *)items
{
    NSMutableDictionary *sortedDictionary = [NSMutableDictionary dictionary];
    
    for (id <TSCTableRowDataSource> item in items) {
        
        NSString *firstLetter = [[[item rowTitle] substringToIndex:1] uppercaseString];
        
        if (firstLetter) {
            
            NSMutableArray *subItems = sortedDictionary[firstLetter];
            
            if (!subItems) {
                sortedDictionary[firstLetter] = [NSMutableArray array];
            }
            
            [subItems addObject:item];
        }
    }
    
    return sortedDictionary;
}

@end
