//
//  UIDevice+WoolyUIKit.m
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

#import "UIDevice+WoolyUIKit.h"


@implementation UIDevice(WoolyUIKit)

/*
 *
 *
 *
 */
- (BOOL)isLandscape
{
	return UIDeviceOrientationIsLandscape(self.orientation);
}

/*
 *
 *
 *
 */
- (BOOL)isPortrait
{
	return UIDeviceOrientationIsPortrait(self.orientation);
}

/*
 *
 *
 *
 */
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
