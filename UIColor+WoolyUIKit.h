//
//  UIColor+WoolyUIKit.h
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

@interface UIColor(WoolyUIKit)
@property (nonatomic,readonly) CGFloat alpha;

+ (UIColor *)blueGrayColor;

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
