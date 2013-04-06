//
//  UIFont+WoolyUIKit.m
//  WoolyUI
//
//  Created by Scott Chandler on 4/10/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "UIFont+WoolyUIKit.h"


@implementation UIFont(WoolyUIKit)

/*
 *
 *
 *
 */
- (CGFloat)height
{
	return self.ascender - self.descender;
}

@end
