//
//  GeometryExtrasTests.m
//  WoolyUI
//
//  Created by Scott Chandler on 4/5/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//


#import <SenTestingKit/SenTestingKit.h>
#import "GeometryExtras.h"
#import <UIKit/UIKit.h>

@interface GeometryExtrasTests : SenTestCase {
	
}
@end

@implementation GeometryExtrasTests

#define	ASPECT(r)	(CGRectGetWidth(r)/CGRectGetHeight(r))
- (void)testCGRectCenterRectInRect
{
	CGRect smallRect = CGRectMake(0.0, 0.0, 10.0, 10.0);
	CGRect largeRect = CGRectMake(0.0, 0.0, 100.0, 100.0);
	
	CGRect rect = CGRectCenterRectInRect(smallRect, largeRect);
	STAssertTrue(CGRectGetMinX(rect)-CGRectGetMinX(largeRect) == CGRectGetMaxX(largeRect) - CGRectGetMaxX(rect),@"");
	STAssertTrue(CGRectGetMinY(rect)-CGRectGetMinY(largeRect) == CGRectGetMaxY(largeRect) - CGRectGetMaxY(rect),@"");

	rect = CGRectCenterRectInRect(largeRect, smallRect);
	STAssertTrue(CGRectGetMinX(rect)-CGRectGetMinX(smallRect) == CGRectGetMaxX(smallRect) - CGRectGetMaxX(rect),@"");
	STAssertTrue(CGRectGetMinY(rect)-CGRectGetMinY(smallRect) == CGRectGetMaxY(smallRect) - CGRectGetMaxY(rect),@"");
}

- (void)testCGRectAspectFillRectInRect
{
	CGRect square = CGRectMake(0.0, 0.0, 100.0, 100.0);
	CGRect horizontalRectangle = CGRectMake(0.0, 0.0, 200.0, 100.0);
	CGRect verticalRectangle = CGRectMake(0.0, 0.0, 100.0, 200.0);

	CGRect rect = CGRectAspectFillRectInRect(square, horizontalRectangle);
	STAssertTrue(ASPECT(square)==ASPECT(rect),@"");
	STAssertTrue(CGRectGetWidth(rect)==CGRectGetWidth(horizontalRectangle),@"");
	
	rect = CGRectAspectFillRectInRect(square, verticalRectangle);
	STAssertTrue(ASPECT(square)==ASPECT(rect),@"%f",ASPECT(square));
	STAssertTrue(CGRectGetWidth(rect)==CGRectGetWidth(verticalRectangle),@"%f==%f",CGRectGetWidth(rect),CGRectGetWidth(verticalRectangle));
	
	rect = CGRectAspectFillRectInRect(horizontalRectangle, verticalRectangle);
	STAssertTrue(ASPECT(horizontalRectangle)==ASPECT(rect),@"%f",ASPECT(horizontalRectangle));
	STAssertTrue(CGRectGetWidth(rect)==CGRectGetWidth(verticalRectangle),@"%f==%f",CGRectGetWidth(rect),CGRectGetWidth(verticalRectangle));

	rect = CGRectAspectFillRectInRect(verticalRectangle, horizontalRectangle);
	STAssertTrue(ASPECT(verticalRectangle)==ASPECT(rect),@"%f",ASPECT(verticalRectangle));
	STAssertTrue(CGRectGetWidth(rect)==CGRectGetWidth(horizontalRectangle),@"%f==%f",CGRectGetWidth(rect),CGRectGetWidth(horizontalRectangle));
}

- (void)testCGRectAspectFitRectInRect
{
	CGRect square = CGRectMake(0.0, 0.0, 100.0, 100.0);
	CGRect horizontalRectangle = CGRectMake(0.0, 0.0, 200.0, 100.0);
	CGRect verticalRectangle = CGRectMake(0.0, 0.0, 100.0, 200.0);

	CGRect rect = CGRectAspectFitRectInRect(square, horizontalRectangle);
	STAssertTrue(ASPECT(rect)==ASPECT(square),@"Aspect not preserved! Want %f. Got %f",ASPECT(square),ASPECT(rect));
	STAssertTrue(CGRectGetHeight(rect)==CGRectGetHeight(horizontalRectangle),@"%f!=%f",CGRectGetHeight(rect),CGRectGetHeight(horizontalRectangle));
	
	rect = CGRectAspectFitRectInRect(square, verticalRectangle);
	STAssertTrue(ASPECT(rect)==ASPECT(square),@"Aspect not preserved! Want %f. Got %f",ASPECT(square),ASPECT(rect));
	STAssertTrue(CGRectGetWidth(rect)==CGRectGetWidth(verticalRectangle),@"%f!=%f",CGRectGetWidth(rect),CGRectGetWidth(verticalRectangle));
	
	rect = CGRectAspectFitRectInRect(horizontalRectangle, verticalRectangle);
	STAssertTrue(ASPECT(rect)==ASPECT(horizontalRectangle),@"Aspect not preserved! Want %f. Got %f (%@)",ASPECT(horizontalRectangle),ASPECT(rect),NSStringFromCGRect(rect));
	STAssertTrue(CGRectGetWidth(rect)==CGRectGetWidth(verticalRectangle),@"%f!=%f",CGRectGetWidth(rect),CGRectGetWidth(verticalRectangle));
}

- (void)testCGPointOffset
{
	CGPoint	point = CGPointZero;
	point = CGPointOffset(point, 10.0, 10.0);
	STAssertTrue(point.x==10.0,@"");
	STAssertTrue(point.y==10.0,@"");
}

@end
