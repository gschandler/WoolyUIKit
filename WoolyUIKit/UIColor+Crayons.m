//
//  UIColor+Crayons.m
//
//	The MIT License (MIT)
//
//	Copyright (c) 2013 Wooly Beast Software
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "UIColor+Crayons.h"
#import "UIColor+Extensions.h"

static const CGFloat kMaximumHue = 360.0;
#define HUE(angle)	(angle/kMaximumHue)

@implementation UIColor(Crayons)
+ (UIColor *)licoriceColor
{
	return [UIColor blackColor];
}

+ (UIColor *)leadColor
{
	return [UIColor colorWithWhite:0.10 alpha:1.0];
}

+ (UIColor *)tungstenColor
{
	return [UIColor colorWithWhite:0.20 alpha:1.0];
}

+ (UIColor *)ironColor
{
	return [UIColor colorWithWhite:0.30 alpha:1.0];
}

+ (UIColor *)steelColor
{
	return [UIColor colorWithWhite:0.40 alpha:1.0];
}

+ (UIColor *)nickelColor
{
	return [UIColor colorWithWhite:0.50 alpha:1.0];
}

+ (UIColor *)tinColor
{
	return [UIColor colorWithWhite:0.50 alpha:1.0];
}

+ (UIColor *)aluminumColor
{
	return [UIColor colorWithWhite:0.60 alpha:1.0];
}

+ (UIColor *)magnesiumColor
{
	return [UIColor colorWithWhite:0.70 alpha:1.0];
}

+ (UIColor *)silverColor
{
	return [UIColor colorWithWhite:0.80 alpha:1.0];
}

+ (UIColor *)mercuryColor
{
	return [UIColor colorWithWhite:0.90 alpha:1.0];
}

+ (UIColor *)snowColor
{
	return [UIColor whiteColor];
}

+ (UIColor *)blueberryColor
{
	return [UIColor colorWithHue:kBlueColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

+ (UIColor *)springColor
{
	return [UIColor colorWithHue:kGreenColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

+ (UIColor *)maraschinoColor
{
	return [UIColor colorWithHue:kRedColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

+ (UIColor *)tangerineColor
{
	return [UIColor colorWithHue:kOrangeColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

+ (UIColor *)cantaloupeColor
{
	return [UIColor colorWithHue:(kOrangeColorHue+kOrangeColorHue+kYellowColorHue)/3.0 saturation:0.6 brightness:1.0 alpha:1.0];
}

+ (UIColor *)bananaColor
{
	return [UIColor colorWithHue:kYellowColorHue saturation:0.6 brightness:1.0 alpha:1.0];
}

+ (UIColor *)lemonColor
{
	return [UIColor colorWithHue:kYellowColorHue saturation:1.0 brightness:1.0 alpha:1.0];	
}

+ (UIColor *)limeColor
{
	return [UIColor colorWithHue:(kYellowColorHue+kGreenColorHue)/2.0 saturation:1.0 brightness:1.0 alpha:1.0];	
}

+ (UIColor *)cayenneColor
{
	return [UIColor colorWithHue:kRedColorHue saturation:1.0 brightness:0.50 alpha:1.0];
}

+ (UIColor *)mochaColor
{
	return [UIColor colorWithHue:kOrangeColorHue saturation:1.0 brightness:0.50 alpha:1.0];
	
}

+ (UIColor *)turquoiseColor
{
	return [UIColor colorWithHue:kCyanColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

+ (UIColor *)iceColor
{
	return [UIColor colorWithHue:kCyanColorHue saturation:0.6 brightness:1.0 alpha:1.0];
}

+ (UIColor *)aquaColor
{
	return [UIColor colorWithHue:kAquaColorHue saturation:1.0 brightness:1.0 alpha:1.0];
}

+ (UIColor *)skyColor
{
	return [UIColor colorWithHue:(kAquaColorHue+kAquaColorHue+kCyanColorHue)/3.0 saturation:0.60 brightness:1.0 alpha:1.0];
}

+ (UIColor *)carnationColor
{
	return [UIColor colorWithHue:HUE(320.0) saturation:0.56 brightness:1.0 alpha:1.0];
}

+ (UIColor *)lavenderColor
{
	return [UIColor colorWithHue:(kMagentaColorHue+kMagentaColorHue+kBlueColorHue)/3.0 saturation:0.60 brightness:1.0 alpha:1.0];
}

@end
