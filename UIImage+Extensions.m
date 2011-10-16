//
//  UIImage+Extensions.m
//  WBUtilities
//
//  Created by Scott Chandler on 1/22/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import "UIImage+Extensions.h"


@implementation UIImage (WoolyBeast)
- (UIImage *)stretchableImageWithLeftCapPercent:(CGFloat)leftCapPercent topCapPercent:(CGFloat)topCapPercent
{
    NSParameterAssert(leftCapPercent>=0.0 && leftCapPercent<=1.0);
    NSParameterAssert(topCapPercent>=0.0 && topCapPercent<=1.0);
    
    CGSize size = self.size;
    UIImage *image = [self stretchableImageWithLeftCapWidth:lrintf(size.width * leftCapPercent) topCapHeight:lrintf(size.height * topCapPercent)];
    return image;
}

+ (UIImage *)stretchableImageNamed:(NSString *)name leftCapPercent:(CGFloat)leftCapPercent topCapPercent:(CGFloat)topCapPercent
{
    NSParameterAssert(name);
    
    UIImage *image = [UIImage imageNamed:name];
    NSAssert(image,@"Invalid UIImage object (nil)");
    CGSize imageSize = image.size;
    
    image = [image stretchableImageWithLeftCapWidth:imageSize.width * leftCapPercent topCapHeight:imageSize.height * topCapPercent];
    
    return image;
}

+ (UIImage *)stretchableImageNamed:(NSString *)name leftCapWidth:(NSUInteger)leftCapWidth topCapHeight:(NSUInteger)topCapHeight
{
    NSParameterAssert(name);
    UIImage *image = [UIImage imageNamed:name];
    NSAssert(image!=nil,@"Invalid UIImage object (nil)");
    image = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    return image;    
}

+ (NSArray *)imagesWithNames:(NSArray *)names
{
	NSParameterAssert(names);
	NSMutableArray *images = [NSMutableArray arrayWithCapacity:names.count];
	for (NSString *name in names ) {
		[images addObject:[UIImage imageNamed:name]];
	}
	return images;
}

@end
