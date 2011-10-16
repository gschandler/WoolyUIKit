//
//  UISplitViewController+Extensions.m
//  WoolyUI
//
//  Created by Scott Chandler on 9/19/11.
//  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import "UISplitViewController+Extensions.h"

@implementation UISplitViewController(WoolyBeast)

- (void)setMainViewController:(UIViewController *)mainViewController
{
	NSParameterAssert(mainViewController);
	[self setViewControllers:[NSArray arrayWithObjects:mainViewController, self.detailViewController, nil]];
}

- (void)setDetailViewController:(UIViewController *)detailViewController
{
	NSParameterAssert(detailViewController);
	[self setViewControllers:[NSArray arrayWithObjects:self.mainViewController, detailViewController, nil]];
}

- (UIViewController *)mainViewController
{
	return [self.viewControllers firstObject];
}

- (UIViewController *)detailViewController
{
	return [self.viewControllers lastObject];
}
@end
