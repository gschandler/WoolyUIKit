//
//  UIButton+Extensions.m
//  WoolyUI
//
//  Created by Scott Chandler on 9/30/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "UIButton+Extensions.h"


@implementation UIButton(WoolyBeast)
- (void)stretchBackgroundImageWithLeftCapWidth:(CGFloat)leftCapWidth topCapHeight:(CGFloat)topCapHeight forState:(UIControlState)state
{
	NSParameterAssert(leftCapWidth<=1.0);
	NSParameterAssert(leftCapWidth>=0.0);
	NSParameterAssert(topCapHeight<=1.0);
	NSParameterAssert(topCapHeight>=0.0);

	UIImage *image = [self backgroundImageForState:state];
	if ( image ) {
		CGSize size = image.size;

		
		image = [image stretchableImageWithLeftCapWidth:lrintf(size.width * leftCapWidth) topCapHeight:lrintf(size.height * topCapHeight)];
		[self setBackgroundImage:image forState:state];
	}
}

@end
