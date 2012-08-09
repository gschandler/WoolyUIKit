/*
 *  GeometryExtras.c
 *  WoolyUI
 *
 *  Created by Scott Chandler on 5/25/10.
 *  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
 *
 */

#include "GeometryExtras.h"
#include <math.h>

CGRect	CGRectCenterRectInRect( CGRect rect, CGRect target )
{
	CGFloat dx = ((CGRectGetWidth(target) - CGRectGetWidth(rect))/2.0) + CGRectGetMinX(target) - CGRectGetMinX(rect);
	CGFloat dy = ((CGRectGetHeight(target) - CGRectGetHeight(rect))/2.0) + CGRectGetMinY(target) - CGRectGetMinY(rect);
	rect = CGRectOffset(rect, dx, dy);
	return rect;
}

//
//	Method:	
//		
//
//	Synopsis:
//		
//
CGRect	CGRectAspectFillRectInRect( CGRect srcRect, CGRect dstRect )
{
	CGRect rect = CGRectZero;
	
	CGFloat width = CGRectGetWidth(dstRect);
	CGFloat height = roundf((width * srcRect.size.height)/srcRect.size.width);
	
	rect.size.width = width;
	rect.size.height = height;
	return rect;
}

//
//	Method:	
//		
//
//	Synopsis:
//		
//
CGRect	CGRectAspectFitRectInRect( CGRect srcRect, CGRect dstRect )
{
	CGRect rect = CGRectZero;
	
	CGFloat height = 0.0;
	CGFloat width = 0.0;

	CGFloat aspect = CGRectGetWidth(srcRect)/CGRectGetHeight(srcRect);
	CGFloat xRatio = CGRectGetWidth(dstRect)/CGRectGetWidth(srcRect);
	CGFloat yRatio = CGRectGetHeight(dstRect)/CGRectGetHeight(srcRect);
	if ( xRatio < yRatio ) {
		width = CGRectGetWidth(dstRect);
		height = roundf(width / aspect);
	}
	else {
		height = CGRectGetHeight(dstRect);
		width = roundf( height * aspect );
	}
	
	rect.size.height = height;
	rect.size.width = width;
	
	
	return rect;
}

//
//	Method:	
//		
//
//	Synopsis:
//		
//
CGPoint	CGPointOffset( CGPoint point, CGFloat dx, CGFloat dy )
{
	point.x += dx; point.y += dy;
	return point;
}