//
//  WBPopoverModerator.m
//  WBUtilities
//
//  Created by Scott Chandler on 12/21/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBPopoverCoordinator.h"

@interface WBPopoverCoordinator()
//@property (nonatomic,retain) UIPopoverController *popoverController;

@end

@interface WBPopoverCoordinator(TimeOut)
- (void)dismissPopoverAfterTimeOut:(NSNumber *)animated;
@end

@implementation WBPopoverCoordinator
@synthesize delegate=_delegate;

//
//	Method:
//		
//
//	Synopsis:
//		
//
+ (WBPopoverCoordinator *)sharedPopoverCoordinator
{
	static WBPopoverCoordinator *popoverCooordinator = nil;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		popoverCooordinator = [WBPopoverCoordinator new];
	});

	return popoverCooordinator;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)setDelegate:(id <WBPopoverModeratorDelegate>)delegate
{
	_delegate = delegate;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)setPopoverController:(UIPopoverController *)pc
{
	if ( _popoverController != pc ) {
		if ( [self.popoverController isPopoverVisible] ) {
			[self cancelDismissPopoverWithDelay];
			[self.popoverController dismissPopoverAnimated:NO];
		}
		WBRelease(_popoverController);
		
		_popoverController = [pc retain];
	}
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (UIPopoverController * )popoverController
{
	return _popoverController;
}


//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)dismissPopoverAnimated:(BOOL)animated
{
	if ( [self.popoverController isPopoverVisible] ) {
		[self cancelDismissPopoverWithDelay];
		[self.popoverController dismissPopoverAnimated:animated];
	}
	self.popoverController = nil;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)dismissPopoverWithDelay:(NSTimeInterval)delay animated:(BOOL)animated
{
	[self cancelDismissPopoverWithDelay];
	if ( [self.popoverController isPopoverVisible] && delay > 0.0 ) {
		[self performSelector:@selector(dismissPopoverAfterTimeOut:) withObject:[NSNumber numberWithBool:animated] afterDelay:delay];
	}
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)cancelDismissPopoverWithDelay
{
	[NSObject cancelPreviousPerformRequestsWithTarget:self];
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)presentPopover:(UIPopoverController *)pc fromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
	NSParameterAssert(view);
	NSParameterAssert(pc);

 	[self cancelDismissPopoverWithDelay];
   
	self.popoverController = pc;
	self.popoverController.delegate = self;
	[self.popoverController presentPopoverFromRect:rect inView:view permittedArrowDirections:arrowDirections animated:animated];
}


//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)presentPopover:(UIPopoverController *)pc fromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
	NSParameterAssert(item);
	NSParameterAssert(pc);
    
 	[self cancelDismissPopoverWithDelay];

	self.popoverController = pc;
	self.popoverController.delegate = self;
	[self.popoverController presentPopoverFromBarButtonItem:item permittedArrowDirections:arrowDirections animated:animated];
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)presentPopoverWithViewController:(UIViewController *)viewController fromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
	NSParameterAssert(viewController);
	NSParameterAssert(view);
	
	UIPopoverController *popoverController = [[UIPopoverController alloc] initWithContentViewController:viewController];
	[self presentPopover:popoverController fromRect:rect inView:view permittedArrowDirections:arrowDirections animated:animated];
	WBRelease(popoverController);
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)presentPopoverWithViewController:(UIViewController *)viewController fromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
	NSParameterAssert(viewController);
	NSParameterAssert(item);
	
	UIPopoverController *popoverController = [[UIPopoverController alloc] initWithContentViewController:viewController];
	[self presentPopover:popoverController fromBarButtonItem:item permittedArrowDirections:arrowDirections animated:animated];
	WBRelease(popoverController);
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)pc
{
	if ( _popoverController == pc ) {
		[self cancelDismissPopoverWithDelay];
		
		if ( self.delegate && [self.delegate respondsToSelector:@selector(popoverModerator:didDismissPopoverController:)] ) {
			[self.delegate popoverModerator:self didDismissPopoverController:self.popoverController];
		}

		self.delegate = nil;
		WBRelease(_popoverController);
	}
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
	BOOL dismiss = YES;
	if ( self.delegate && [self.delegate respondsToSelector:@selector(popoverModerator:shouldDismissPopoverController:)] ) {
		dismiss = [self.delegate popoverModerator:self shouldDismissPopoverController:self.popoverController];
	}
	return dismiss;
}

@end

@implementation WBPopoverCoordinator(TimeOut)
//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)dismissPopoverAfterTimeOut:(NSNumber *)animated
{
	[self dismissPopoverAnimated:[animated boolValue]];
}

@end
