//
//  WBNetworkActivity.m
//  WoolyUI
//
//  Created by Scott Chandler on 3/20/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBNetworkActivity.h"

static WBNetworkActivity * gNetworkActivity = nil;

@implementation WBNetworkActivity

+ (WBNetworkActivity *)sharedNetworkActivity
{
	if ( gNetworkActivity == nil ) {
		gNetworkActivity = [WBNetworkActivity new];
	}
	return gNetworkActivity;
}

- (id)init
{
	self = [super init];
	if ( self ) {
		_lock = [NSLock new];
	}
	return self;
}

- (void)dealloc
{
	WBRelease(_lock);
	[super dealloc];
}

- (void)beginNetworkActivity
{
	if ( [_lock tryLock] ) {
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:_count++ == 0];
		[_lock unlock];
	}
}

- (void)endNetworkActivity
{
	NSAssert(_count>0,@"Unbalanced begin/end network activity");
	
	if ( [_lock tryLock] ) {
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:--_count > 0];
		[_lock unlock];
	}
}
@end
