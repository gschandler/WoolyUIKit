/*
	GeometryExtras.c

	The MIT License (MIT)

	Copyright (c) 2013 Wooly Beast Software

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.

 */

#include "GeometryExtras.h"
#include <math.h>

//
//	Method:
//
//
//	Synopsis:
//
//
CGPoint CGRectGetMidPoint( CGRect rect )
{
	return (CGPoint){CGRectGetMidX(rect),CGRectGetMidY(rect)};
}

//
//	Method:
//
//
//	Synopsis:
//
//
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