//
//  UIView+WoolyUIKit.m
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

#import "UIView+WoolyUIKit.h"

#define	ONE_RAD_IN_DEGREES	(180.0)
#define	DEG_TO_RAD(d)	((d/ONE_RAD_IN_DEGREES) * M_PI)

@implementation UIView(WoolyUIKit)

#pragma mark -
/*
 *
 *
 *
 */
- (void)rotateToDegrees:(CGFloat)angle
{
	CGFloat radians = DEG_TO_RAD(angle);
	[self rotateToRadians:radians];
}

/*
 *
 *
 *
 */
- (void)rotateToRadians:(CGFloat)radians
{
	self.transform = CGAffineTransformRotate(CGAffineTransformIdentity,radians);
}

/*
 *
 *
 *
 */
- (void)rotateByDegrees:(CGFloat)angle
{
	CGFloat radians = DEG_TO_RAD(angle);
	[self rotateByRadians:radians];
}

/*
 *
 *
 *
 */
- (void)rotateByRadians:(CGFloat)radians
{
	self.transform = CGAffineTransformRotate(self.transform,radians);
}


#pragma mark -

/*
 *
 *
 *
 */
- (void)scaleToSize:(CGSize)size
{
	self.transform = CGAffineTransformScale(CGAffineTransformIdentity, size.width, size.height);
}

/*
 *
 *
 *
 */
- (void)scaleBySize:(CGSize)size
{
	self.transform = CGAffineTransformScale(self.transform, size.width, size.height);
}

@end
