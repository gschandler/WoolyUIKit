//
//  UIViewController+WoolyUIKit.h
//  WoolyUI
//
//  Created by Scott Chandler on 9/9/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (WoolyUIKit)
@property (nonatomic,readonly,getter = isModal) BOOL modal;

@end
