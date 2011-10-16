/*
 *  MathUtils.h
 *  Gigbook
 *
 *  Created by Scott Chandler on 12/9/10.
 *  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
 *
 */

#ifndef	MATH_UTILS
#define	MATH_UTILS

#include <CoreGraphics/CoreGraphics.h>

#if __cplusplus
extern "C" {
#endif

// return kCFCompareEqualTo if a == b (± small threshold)
// return kCFCompareLessThan if a < b
// return kCFCompareGreaterThan if a > b
CFComparisonResult	CGFloatCompare( CGFloat a, CGFloat b );

#if __cplusplus
};
#endif

#endif