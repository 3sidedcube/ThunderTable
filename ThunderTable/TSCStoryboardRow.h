//
//  TSCStoryboardRow.h
//  ThunderTable
//
//  Created by Matthew Cheetham on 24/09/2015.
//  Copyright © 2015 threesidedcube. All rights reserved.
//

@import Foundation;
#import "TSCTableRowDataSource.h"

/**
 The purpose of this class is to allow storyboard prototype rows to be initialised and used throughout ThunderTable
 */
@interface TSCStoryboardRow : NSObject <TSCTableRowDataSource>

/**
 The identifier specified in your storyboard file for the prototype row
 */
@property (nonatomic, copy) NSString *prototypeIdentifier;

/**
 Initializes the row with a prototype cell
 @param identifier The identifier for the prototype cell to load
 */
+ (instancetype)rowWithPrototypeIdentifier:(NSString *)identifier;

@end
