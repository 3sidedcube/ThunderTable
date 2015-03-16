//
//  TSCTableInputViewCell.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableViewCell.h"
#import "TSCTableInputRowDataSource.h"

@class TSCTableInputRow;

@protocol TSCTableInputViewCellDelegate <NSObject>

@optional

- (void)tableInputViewCellDidFinish:(TSCTableViewCell *)cell;

@end

@interface TSCTableInputViewCell : TSCTableViewCell

@property (nonatomic, strong) NSObject <TSCTableInputRowDataSource> *inputRow;
@property (nonatomic, weak) id <TSCTableInputViewCellDelegate> delegate;

@end
