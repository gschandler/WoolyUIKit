//
//  UIViewController+WoolyUIKit.m
//  WoolyUI
//
//  Created by Scott Chandler on 9/9/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import "UIViewController+WoolyUIKit.h"

@implementation UIViewController (WoolyUIKit)

- (BOOL)isModal
{
	BOOL modal = self.presentingViewController != self;
#if 0
	if ( self.parentViewController ) {
		modal = self.parentViewController.modalViewController == self;
	}
#endif
	return modal;
}
@end
