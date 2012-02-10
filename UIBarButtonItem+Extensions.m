//
//  UIBarButtonItem+Extensions.m
//  WoolyUI
//
//  Created by Scott Chandler on 1/22/12.
//  Copyright (c) 2012 Wooly Beast Software, LLC. All rights reserved.
//

#import "UIBarButtonItem+Extensions.h"

@implementation UIBarButtonItem (Extensions)
+ (UIBarButtonItem *)flexibleSpace
{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
}

+ (UIBarButtonItem *)fixedSpaceWithWidth:(CGFloat)width
{
	UIBarButtonItem *item = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil] autorelease];
	item.width = width;
	return item;
}

+ (UIBarButtonItem *)actionBarButtonItemWithTarget:(id)target action:(SEL)action
{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:target action:action] autorelease];
}

+ (UIBarButtonItem *)addBarButtonItemWithTarget:(id)target action:(SEL)action
{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:target action:action] autorelease];
}

+ (UIBarButtonItem *)doneBarButtonItemWithTarget:(id)target action:(SEL)action
{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:target action:action] autorelease];
}

+ (UIBarButtonItem *)cancelBarButtonItemWithTarget:(id)target action:(SEL)action
{
	return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:target action:action] autorelease];
}

@end
