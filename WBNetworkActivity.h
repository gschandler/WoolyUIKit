//
//  WBNetworkActivity.h
//  WoolyUI
//
//  Created by Scott Chandler on 3/20/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WBNetworkActivity : NSObject {
	NSUInteger		_count;
	NSLock			*_lock;
}

+ (WBNetworkActivity *)sharedNetworkActivity;

- (void)beginNetworkActivity;
- (void)endNetworkActivity;

@end
