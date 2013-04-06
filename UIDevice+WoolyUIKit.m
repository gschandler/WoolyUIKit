//
//  UIDevice+WoolyUIKit.m
//  WoolyUI
//
//  Created by Scott Chandler on 8/29/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "UIDevice+WoolyUIKit.h"


@implementation UIDevice(WoolyUIKit)

- (BOOL)isLandscape
{
	return UIDeviceOrientationIsLandscape(self.orientation);
}

- (BOOL)isPortrait
{
	return UIDeviceOrientationIsPortrait(self.orientation);
}

- (CGAffineTransform)transform
{
	CGFloat pi = 3.141592;
	CGAffineTransform transform = CGAffineTransformIdentity;
	switch (self.orientation) {
		case	UIDeviceOrientationUnknown :
		case	UIDeviceOrientationFaceUp :
		case	UIDeviceOrientationFaceDown :
		case	UIDeviceOrientationPortrait : break;
		case	UIDeviceOrientationPortraitUpsideDown : transform = CGAffineTransformRotate(transform, pi); break;
		case	UIDeviceOrientationLandscapeLeft : transform = CGAffineTransformRotate(transform, pi/2.0); break;
		case	UIDeviceOrientationLandscapeRight : transform = CGAffineTransformRotate(transform, (2.0 * pi)/3.0); break;
	}
	return transform;
}
@end
