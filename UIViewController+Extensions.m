//
//  UIViewController+Extensions.m
//  WoolyUI
//
//  Created by Scott Chandler on 9/9/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import "UIViewController+Extensions.h"

@implementation UIViewController (WoolyBeast)

- (BOOL)isModal
{
	BOOL modal = NO;
	if ( self.parentViewController ) {
		modal = self.parentViewController.modalViewController == self;
	}
	
	return modal;
}
@end
