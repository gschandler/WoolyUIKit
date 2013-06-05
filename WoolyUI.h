/*
 *  WoolyUI.h
 *  WoolyUI
 *
 *  Created by Scott Chandler on 3/6/11.
 *  Copyright 2011 Wooly Beast Software, LLC. All rights reserved.
 *
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
