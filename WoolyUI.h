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
#define	WBRelease(obj)	{[obj release]; obj = nil;}
#endif

#import "UIKit+Extensions.h"

#import "GeometryExtras.h"
#import "MathUtils.h"

// Misc.
#import "WBPopoverCoordinator.h"
#import "WBActionSheetCoordinator.h"
#import "WBNetworkActivity.h"

#import "WBTableConfiguration.h"
#import "WBTableViewCellController.h"
#import "WBAlertViewCoordinator.h"