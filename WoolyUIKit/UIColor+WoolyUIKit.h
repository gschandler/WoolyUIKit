//
//  UIColor+WoolyUIKit.h
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

#import <UIKit/UIKit.h>

extern const CGFloat kRedColorHue;
extern const CGFloat kOrangeColorHue;
extern const CGFloat kYellowColorHue;
extern const CGFloat kGreenColorHue;
extern const CGFloat kCyanColorHue;
extern const CGFloat kAquaColorHue;
extern const CGFloat kBlueColorHue;
extern const CGFloat kMagentaColorHue;

@interface UIColor(WoolyUIKit)
@property (nonatomic,readonly) CGFloat alpha;

+ (UIColor *)blueGrayColor;

// adjust a current color by component and return new color
- (UIColor *)colorWithHue:(CGFloat)hue;
- (UIColor *)colorWithSaturation:(CGFloat)saturation;
- (UIColor *)colorWithBrightness:(CGFloat)brightness;

@end



@interface UIColor(Crayons)

+ (UIColor *)licoriceColor;
+ (UIColor *)leadColor;
+ (UIColor *)tungstenColor;
+ (UIColor *)ironColor;
+ (UIColor *)steelColor;
+ (UIColor *)nickelColor;
+ (UIColor *)tinColor;
+ (UIColor *)aluminumColor;
+ (UIColor *)magnesiumColor;
+ (UIColor *)silverColor;
+ (UIColor *)mercuryColor;
+ (UIColor *)snowColor;

+ (UIColor *)aquaColor;
+ (UIColor *)bananaColor;
+ (UIColor *)cantaloupeColor;
+ (UIColor *)cayenneColor;
+ (UIColor *)blueberryColor;
+ (UIColor *)iceColor;
+ (UIColor *)lemonColor;
+ (UIColor *)limeColor;
+ (UIColor *)maraschinoColor;
+ (UIColor *)mochaColor;
+ (UIColor *)springColor;
+ (UIColor *)tangerineColor;
+ (UIColor *)carnationColor;
+ (UIColor *)lavenderColor;
+ (UIColor *)skyColor;
+ (UIColor *)turquoiseColor;
@end
