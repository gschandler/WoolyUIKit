//
//  UIBarButtonItem+WoolyUIKit.h
//  WoolyUI
//
//  Created by Scott Chandler on 1/22/12.
//  Copyright (c) 2012 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WoolyUIKit)
+ (UIBarButtonItem *)flexibleSpace;
+ (UIBarButtonItem *)fixedSpaceWithWidth:(CGFloat)width;

+ (UIBarButtonItem *)actionBarButtonItemWithTarget:(id)target action:(SEL)action;
+ (UIBarButtonItem *)addBarButtonItemWithTarget:(id)target action:(SEL)action;

+ (UIBarButtonItem *)doneBarButtonItemWithTarget:(id)target action:(SEL)action;
+ (UIBarButtonItem *)cancelBarButtonItemWithTarget:(id)target action:(SEL)action;
@end
