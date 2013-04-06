//
//  UIImage+WoolyUIKit.h
//  WBUtilities
//
//  Created by Scott Chandler on 1/22/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (WoolyUIKit)
- (UIImage *)stretchableImageWithLeftCapPercent:(CGFloat)leftCapPercent topCapPercent:(CGFloat)topCapPercent;	// 0.0 - 1.0

+ (UIImage *)stretchableImageNamed:(NSString *)name leftCapPercent:(CGFloat)leftCapPercent topCapPercent:(CGFloat)topCapPercent;     // cap height/width 0.0 - 1.0
+ (UIImage *)stretchableImageNamed:(NSString *)name leftCapWidth:(NSUInteger)leftCapWidth topCapHeight:(NSUInteger)topCapHeight;     // cap height/width 0.0 - 

+ (NSArray *)imagesWithNames:(NSArray *)names;
+ (NSArray *)imagesWithContentsOfFiles:(NSArray *)paths;
@end
