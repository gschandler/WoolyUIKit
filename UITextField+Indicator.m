//
//  UITextField+Indicator.m
//  Gigbook
//
//  Created by Scott Chandler on 11/24/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "UITextField+Indicator.h"

#define USE_UNICODE	(!0)
static NSString * const kUnicodeCheckMark = @"\u2714";
static NSString * const kUnicodeCrossMark = @"\u274C";

@implementation UITextField(Indicator)
#if 0
- (void)showValidEntryIndicator:(BOOL)show isValid:(BOOL)valid
{
	UIView *view = nil;
#if USE_UNICODE
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 20.0, 20.0)];
	label.textColor = [UIColor lightGrayColor];
	label.font = [UIFont boldSystemFontOfSize:24.0];
	label.text = (valid) ? kUnicodeCheckMark : kUnicodeCrossMark;
	view = label;
#else
	UIImage *image = [UIImage imageNamed:(valid) ? @"ValidName.png" : @"InvalidName.png"];
	view = [[UIImageView alloc] initWithImage:image];
#endif
	view.backgroundColor = [UIColor clearColor];
	self.leftView = view;
	
	self.leftViewMode = (show) ? UITextFieldViewModeAlways : UITextFieldViewModeNever;
	WBRelease(view);
}

- (void)indicateInvalidText:(BOOL)invalid
{
	self.leftViewMode = (invalid) ? UITextFieldViewModeAlways : UITextFieldViewModeNever;
	if ( invalid && self.text.length > 0 ) {
		UIView *view = nil;
#if USE_UNICODE
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 20.0, 20.0)];
		label.font = [UIFont systemFontOfSize:24.0];
		label.text = kUnicodeCrossMark;
		view = label;
#else
		UIImage *image = [UIImage imageNamed:@"InvalidName.png"];
		view = [[UIImageView alloc] initWithImage:image];
#endif
		self.leftView = view;
	}
	else {
		self.leftView = nil;
	}

}
#endif

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
