/*
	WoolyUI.h

	The MIT License (MIT)

	Copyright (c) 2013 Wooly Beast Software

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.

 */

#import "WoolyToolkit.h"

#ifndef LOG_METHOD
#if WBDEBUG
#define	LOG_METHOD	NSLog(@"%@:%d (%@)",NSStringFromSelector(_cmd),__LINE__,NSStringFromClass([self class]))
#else
#define	LOG_METHOD
#endif
#endif

#ifndef WBRelease
#if __has_feature(objc_arc)
#define	WBRelease(obj)	obj = nil
#else
#define	WBRelease(obj)	[obj release]; obj = nil
#endif
#endif

#import "UIBarButtonItem+WoolyUIKit.h"
#import "UIButton+WoolyUIKit.h"
#import "UIColor+WoolyUIKit.h"
#import "UIDevice+WoolyUIKit.h"
#import "UIFont+WoolyUIKit.h"
#import "UIImage+WoolyUIKit.h"
#import "UISplitViewController+WoolyUIKit.h"
#import "UITableView+WoolyUIKit.h"
#import "UITextField+WoolyUIKit.h"
#import "UIView+WoolyUIKit.h"
#import "UIViewController+WoolyUIKit.h"

#import "GeometryExtras.h"
#import "MathUtils.h"
