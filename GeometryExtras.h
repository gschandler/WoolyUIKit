/*
 *  GeometryExtras.h
 *  Gigbook
 *
 *  Created by Scott Chandler on 5/25/10.
 *  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
 *
 */

#ifndef GEOMETRY_EXTRAS
#define	GEOMETRY_EXTRAS	!0

#include	<CoreGraphics/CoreGraphics.h>

#if __cplusplus
extern "C" {
#endif
	
CGRect	CGRectCenterRectInRect( CGRect rect, CGRect target );

CGRect	CGRectAspectFillRectInRect( CGRect srcRect, CGRect dstRect );
CGRect	CGRectAspectFitRectInRect( CGRect srcRect, CGRect dstRect );

CGPoint	CGPointOffset( CGPoint point, CGFloat dx, CGFloat dy );

#if __cplusplus
};
#endif

#endif