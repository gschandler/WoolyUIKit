//
//  UIColor+WoolyUIKit.m
//  WoolyUI
//
//  Created by Scott Chandler on 5/6/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "UIColor+WoolyUIKit.h"

#define HUE(v)	(v/360.0)
const CGFloat kRedColorHue		= HUE(0.0);
const CGFloat kOrangeColorHue   = HUE(30.0);
const CGFloat kYellowColorHue	= HUE(60.0);
const CGFloat kGreenColorHue	= HUE(120.0);
const CGFloat kCyanColorHue		= HUE(180.0);
const CGFloat kAquaColorHue     = HUE(210.0);
const CGFloat kBlueColorHue		= HUE(240.0);
const CGFloat kMagentaColorHue	= HUE(300.0);

@implementation UIColor(WoolyUIKit)

/*
 *
 *
 *
 */
- (CGFloat)alpha
{
	CGColorRef color = self.CGColor;
	CGFloat value = CGColorGetAlpha(color);
	return value;
}

/*
 *
 *
 *
 */
+ (UIColor *)blueGrayColor
{
	return [UIColor colorWithHue:HUE(220.0) saturation:0.62 brightness:0.52 alpha:1.0];
}

@end


@implementation UIColor(Crayons)
/*
 *
 *
 *
 */
+ (UIColor *)licoriceColor
{
	return [UIColor blackColor];
}

/*
 *
 *
 *
 */
+ (UIColor *)leadColor
{
	return [UIColor colorWithWhite:0.10 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)tungstenColor
{
	return [UIColor colorWithWhite:0.20 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)ironColor
{
	return [UIColor colorWithWhite:0.30 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)steelColor
{
	return [UIColor colorWithWhite:0.40 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)nickelColor
{
	return [UIColor colorWithWhite:0.50 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)tinColor
{
	return [UIColor colorWithWhite:0.50 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)aluminumColor
{
	return [UIColor colorWithWhite:0.60 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)magnesiumColor
{
	return [UIColor colorWithWhite:0.70 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)silverColor
{
	return [UIColor colorWithWhite:0.80 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)mercuryColor
{
	return [UIColor colorWithWhite:0.90 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)snowColor
{
	return [UIColor whiteColor];
}

/*
 *
 *
 *
 */
+ (UIColor *)blueberryColor
{
	return [UIColor colorWithHue:kBlueColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)springColor
{
	return [UIColor colorWithHue:kGreenColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)maraschinoColor
{
	return [UIColor colorWithHue:kRedColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)tangerineColor
{
	return [UIColor colorWithHue:kOrangeColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)cantaloupeColor
{
	return [UIColor colorWithHue:(kOrangeColorHue+kOrangeColorHue+kYellowColorHue)/3.0 saturation:0.6 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)bananaColor
{
	return [UIColor colorWithHue:kYellowColorHue saturation:0.6 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)lemonColor
{
	return [UIColor colorWithHue:kYellowColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)limeColor
{
	return [UIColor colorWithHue:(kYellowColorHue+kGreenColorHue)/2.0 saturation:1.0 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)cayenneColor
{
	return [UIColor colorWithHue:kRedColorHue saturation:1.0 brightness:0.50 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)mochaColor
{
	return [UIColor colorWithHue:kOrangeColorHue saturation:1.0 brightness:0.50 alpha:1.0];
	
}

/*
 *
 *
 *
 */
+ (UIColor *)turquoiseColor
{
	return [UIColor colorWithHue:kCyanColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)iceColor
{
	return [UIColor colorWithHue:kCyanColorHue saturation:0.6 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)aquaColor
{
	return [UIColor colorWithHue:kAquaColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)skyColor
{
	return [UIColor colorWithHue:(kAquaColorHue+kAquaColorHue+kCyanColorHue)/3.0 saturation:0.60 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)carnationColor
{
	return [UIColor colorWithHue:HUE(320.0) saturation:0.56 brightness:1.0 alpha:1.0];
}

/*
 *
 *
 *
 */
+ (UIColor *)lavenderColor
{
	return [UIColor colorWithHue:(kMagentaColorHue+kMagentaColorHue+kBlueColorHue)/3.0 saturation:0.60 brightness:1.0 alpha:1.0];
}

@end
