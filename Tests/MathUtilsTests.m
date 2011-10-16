//
//  MathUtilsTests.m
//  WoolyUI
//
//  Created by Scott Chandler on 4/5/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "MathUtils.h"

@interface MathUtilsTests : SenTestCase {
	
}
@end

@implementation MathUtilsTests

- (void) testCFloatCompare {
    
	STAssertTrue(CGFloatCompare(1.0,1.0) == kCFCompareEqualTo,@"1.0==1.0 failed");
	STAssertTrue(CGFloatCompare(1.0,2.0) == kCFCompareLessThan,@"1.0<2.0 failed");
	STAssertTrue(CGFloatCompare(2.0,1.0) == kCFCompareGreaterThan,@"2.0>1.0 failed");
}

@end
