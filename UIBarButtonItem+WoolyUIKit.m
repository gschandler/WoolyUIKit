//
//  UIBarButtonItem+WoolyUIKit.m
//
//	The MIT License (MIT)
//
//	Copyright (c) 2013 Wooly Beast Software
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "UIBarButtonItem+WoolyUIKit.h"

@implementation UIBarButtonItem (WoolyUIKit)
/*
 *
 *
 *
 */
+ (UIBarButtonItem *)flexibleSpace
{
	UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
#if !__has_feature(objc_arc)
	[barButtonItem autorelease];
#endif
	return barButtonItem;
}

/*
 *
 *
 *
 */
+ (UIBarButtonItem *)fixedSpaceWithWidth:(CGFloat)width
{
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
#if !__has_feature(objc_arc)
	[item autorelease];
#endif
	item.width = width;
	return item;
}

/*
 *
 *
 *
 */
+ (UIBarButtonItem *)actionBarButtonItemWithTarget:(id)target action:(SEL)action
{
	UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:target action:action];
#if !__has_feature(objc_arc)
	[barButtonItem autorelease];
#endif
	return barButtonItem;
}

/*
 *
 *
 *
 */
+ (UIBarButtonItem *)addBarButtonItemWithTarget:(id)target action:(SEL)action
{
	UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:target action:action];
#if !__has_feature(objc_arc)
	[barButtonItem autorelease];
#endif
	return barButtonItem;
}

/*
 *
 *
 *
 */
+ (UIBarButtonItem *)doneBarButtonItemWithTarget:(id)target action:(SEL)action
{
	UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:target action:action];
#if !__has_feature(objc_arc)
	[barButtonItem autorelease];
#endif
	return barButtonItem;
}

/*
 *
 *
 *
 */
+ (UIBarButtonItem *)cancelBarButtonItemWithTarget:(id)target action:(SEL)action
{
	UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:target action:action];
#if !__has_feature(objc_arc)
	[barButtonItem autorelease];
#endif
	return barButtonItem;
}

@end
