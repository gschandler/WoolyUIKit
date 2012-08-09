//
//  UIView+Geometry.m
//  WoolyUI
//
//  Created by Scott Chandler on 8/30/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "UIView+Geometry.h"

#define	ONE_RAD_IN_DEGREES	(180.0)
#define	DEG_TO_RAD(d)	((d/ONE_RAD_IN_DEGREES) * M_PI)

@implementation UIView(Geometry)

#pragma mark -
- (void)rotateToDegrees:(CGFloat)angle
{
	CGFloat radians = DEG_TO_RAD(angle);
	[self rotateToRadians:radians];
}

- (void)rotateToRadians:(CGFloat)radians
{
	self.transform = CGAffineTransformRotate(CGAffineTransformIdentity,radians);
}

- (void)rotateByDegrees:(CGFloat)angle
{
	CGFloat radians = DEG_TO_RAD(angle);
	[self rotateByRadians:radians];
}

- (void)rotateByRadians:(CGFloat)radians
{
	self.transform = CGAffineTransformRotate(self.transform,radians);
}


#pragma mark -

- (void)scaleToSize:(CGSize)size
{
	self.transform = CGAffineTransformScale(CGAffineTransformIdentity, size.width, size.height);
}

- (void)scaleBySize:(CGSize)size
{
	self.transform = CGAffineTransformScale(self.transform, size.width, size.height);
}

@end
