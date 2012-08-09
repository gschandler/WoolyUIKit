//
//  UIColor+Extensions.h
//  WoolyUI
//
//  Created by Scott Chandler on 5/6/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const CGFloat kRedColorHue;
extern const CGFloat kOrangeColorHue;
extern const CGFloat kYellowColorHue;
extern const CGFloat kGreenColorHue;
extern const CGFloat kCyanColorHue;
extern const CGFloat kAquaColorHue;
extern const CGFloat kBlueColorHue;
extern const CGFloat kMagentaColorHue;

@interface UIColor(WoolyBeast)
@property (nonatomic,readonly) CGFloat alpha;

+ (UIColor *)blueGrayColor;

@end
