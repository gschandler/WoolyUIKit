//
//  UIColor+Extensions.m
//  WoolyUI
//
//  Created by Scott Chandler on 5/6/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "UIColor+Extensions.h"

#define HUE(v)	(v/360.0)
const CGFloat kRedColorHue		= HUE(0.0);
const CGFloat kOrangeColorHue   = HUE(30.0);
const CGFloat kYellowColorHue	= HUE(60.0);
const CGFloat kGreenColorHue	= HUE(120.0);
const CGFloat kCyanColorHue		= HUE(180.0);
const CGFloat kAquaColorHue     = HUE(210.0);
const CGFloat kBlueColorHue		= HUE(240.0);
const CGFloat kMagentaColorHue	= HUE(300.0);

@implementation UIColor(WoolyBeast)

- (CGFloat)alpha
{
	CGColorRef color = self.CGColor;
	CGFloat value = CGColorGetAlpha(color);
	return value;
}

+ (UIColor *)blueGrayColor
{
	return [UIColor colorWithHue:HUE(220.0) saturation:0.62 brightness:0.52 alpha:1.0];
}

@end
