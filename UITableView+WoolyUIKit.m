//
//  UITableView+WoolyUIKit.m
//  WoolyUI
//
//  Created by Scott Chandler on 10/18/11.
//  Copyright (c) 2011 Wooly Beast Software, LLC. All rights reserved.
//

#import "UITableView+WoolyUIKit.h"

@implementation UITableView (WoolyUIKit)
- (NSIndexPath *)indexPathForLastRowInSection:(NSUInteger)section
{
	NSIndexPath *indexPath = nil;
	if ( self.numberOfSections > section && [self numberOfRowsInSection:section] > 0 ) {
		indexPath = [NSIndexPath indexPathForRow:[self numberOfRowsInSection:section]-1 inSection:section];
	}
	return indexPath;
}

@end
