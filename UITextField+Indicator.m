//
//  UITextField+Indicator.m
//  WoolyUI
//
//  Created by Scott Chandler on 11/24/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "UITextField+Indicator.h"

#define USE_UNICODE	(!0)
static NSString * const kUnicodeCheckMark = @"\u2714";
static NSString * const kUnicodeCrossMark = @"\u274C";

@implementation UITextField(Indicator)
//
//
//
//	Synopsis:
//
- (void)showInvalidTextIndicator:(BOOL)show
{
	UIView * view = nil;
	UITextFieldViewMode mode = UITextFieldViewModeNever;
	
	if ( show && self.text.length > 0 ) {
		CGRect frame = self.bounds;
		frame.size.height = frame.size.width = roundf(frame.size.height * (2.0/3.0));
		UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
		label.backgroundColor = [UIColor clearColor];
		label.font = [UIFont systemFontOfSize:24.0];
		label.text = kUnicodeCrossMark;
		
		view = label;
		mode = UITextFieldViewModeAlways;
	}
	
	self.leftView = view;
	self.leftViewMode = mode;
}
@end
