/*
 *  MathUtils.c
 *  Gigbook
 *
 *  Created by Scott Chandler on 12/9/10.
 *  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
 *
 */

#include "MathUtils.h"

static const float kFloatThreshold = 0.001;

CFComparisonResult	CGFloatCompare( CGFloat a, CGFloat b )
{
	int	result = kCFCompareEqualTo;
	if ( a - kFloatThreshold > b )
		result = kCFCompareGreaterThan;
	else if ( a + kFloatThreshold < b )
		result = kCFCompareLessThan;
	
	return result;
}
