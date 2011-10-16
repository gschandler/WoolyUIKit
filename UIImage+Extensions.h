//
//  UIImage+Extensions.h
//  WBUtilities
//
//  Created by Scott Chandler on 1/22/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (WoolyBeast)
- (UIImage *)stretchableImageWithLeftCapPercent:(CGFloat)leftCapPercent topCapPercent:(CGFloat)topCapPercent;

+ (UIImage *)stretchableImageNamed:(NSString *)name leftCapPercent:(CGFloat)leftCapPercent topCapPercent:(CGFloat)topCapPercent;     // cap height/width 0.0 - 1.0
+ (UIImage *)stretchableImageNamed:(NSString *)name leftCapWidth:(NSUInteger)leftCapWidth topCapHeight:(NSUInteger)topCapHeight;     // cap height/width 0.0 - 

+ (NSArray *)imagesWithNames:(NSArray *)names;
@end
