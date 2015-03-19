//
//  TSCTableImageRow.h
// ThunderTable
//
//  Created by Phillip Caudell on 29/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableRow.h"

/**
 A subclass of `TSCTableRow` which can be used to display an image which fills the contents of the cell
 */
@interface TSCTableImageRow : TSCTableRow

/**
 @abstract The image to be displayed in the row
 */
@property (nonatomic, strong) UIImage *image;

/**
 @abstract Defines the background colour of the row
 */
@property (nonatomic, strong) UIColor *backgroundColor;

/**
 @abstract Defines the content mode of the image within the row
 */
@property (nonatomic) UIViewContentMode contentMode;

/**
 @abstract Initialises and returns a row with a particular image
 @param image The image to be displayed in the row
 */
+ (id)rowWithImage:(UIImage *)image;

/**
 @abstract Initialises and returns a row with a particular image and content mode
 @param image The image to be displayed in the row
 @param contentMode The content mode to display the image with
 */
+ (id)rowWithImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode;

/**
 @abstract Initialises and returns a row with a particular image and background colour
 @param image The image to be displayed in the row
 @param backgroundColor The background colour of the row
 */
+ (id)rowWithImage:(UIImage *)image backgroundColor:(UIColor *)backgroundColor;

/**
 @abstract Initialises and returns a row with a particular image
 @param url The url to load in the image for the row from
 @param placeholderImage A placeholder image to show until the image has been loaded from the URL provided
 @discussion Once the image has loaded from the URL it will be displayed at the same size as the placeholderImage so make sure that placeholderImage is the same size as the returned image. Not doing so causes strange frame behaviour of the cells `imageView`
 */
+ (id)rowWithImageURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage;

@end
