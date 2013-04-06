//
//  WBActionSheetModerator.m
//  WBUtilities
//
//  Created by Scott Chandler on 12/20/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBActionSheetCoordinator.h"
#import <objc/message.h>


static NSString * const kCancelActionKey		= @"cancel";
static NSString * const kDestructiveActionKey	= @"destructive";
static NSString * const kOtherActionKey			= @"other";
static NSString * const kTitleKey				= @"title";
static NSString * const kActionKey				= @"action";

//static NSString * const kStateKey				= @"state";
//static NSString * const kStatePrepare			= @"prepare";
//static NSString * const kStatePresented			= @"presented";
//static NSString * const kStateDismissed			= @"dismissed";

@interface WBActionSheetCoordinator()
@property (nonatomic,retain) UIActionSheet *actionSheet;
@property (nonatomic,retain) NSMutableDictionary *data;
- (NSInvocation *)invocationForAction:(SEL)action target:(id)target object:(id)object;
#if NS_BLOCKS_AVAILABLE
- (void)prepareToShow;
#endif
- (void)cleanup;
@end

@implementation WBActionSheetCoordinator
@synthesize actionSheet=_actionSheet;
@synthesize delegate=_delegate;
@synthesize data=_data;

/*
 *
 *
 *
 */
+ (WBActionSheetCoordinator *)sharedActionSheetCoordinator
{
	static WBActionSheetCoordinator *actionSheetCoordinator = nil;

	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		actionSheetCoordinator = [WBActionSheetCoordinator new];
	});
    
    return actionSheetCoordinator;
}

/*
 *
 *
 *
 */
- (void)cleanup
{
	self.actionSheet = nil;
	self.data = nil;
#if NS_BLOCKS_AVAILABLE
	if ( _completion ) {
		Block_release(_completion);
		_completion = NULL;
	}
#endif	
}

/*
 *
 *
 *
 */
- (UIActionSheet *)actionSheet
{
	if ( _actionSheet == nil ) {
		_actionSheet = [UIActionSheet new];
		_actionSheet.delegate = self;
	}
	return _actionSheet;
}

/*
 *
 *
 *
 */
- (void)setActionSheet:(UIActionSheet *)actionSheet
{
	if ( _actionSheet != actionSheet ) {
		if ( _actionSheet.isVisible ) {
			[_actionSheet dismissWithClickedButtonIndex:_actionSheet.cancelButtonIndex animated:NO];
		}
		[_actionSheet release];
		_actionSheet = [actionSheet retain];
	}
}

/*
 *
 *
 *
 */
- (NSMutableDictionary *)data
{
	if ( _data == nil ) {
		_data = [NSMutableDictionary new];
	}
	return _data;
}

/*
 *
 *
 *
 */
- (NSInvocation *)invocationForAction:(SEL)action target:(id)target object:(id)object
{
	if ( action == nil ) {
		return (NSInvocation *)[NSNull null];
	}
	
	NSMethodSignature *sig = [target methodSignatureForSelector:action];
	NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
	[invocation setTarget:target];
	[invocation setSelector:action];
	[invocation retainArguments];
	if ( [sig numberOfArguments] > 2 && object ) {
		[invocation setArgument:&object atIndex:2];
	}
	return invocation;
}

/*
 *
 *
 *
 */
- (NSInteger)addButtonWithTitle:(NSString *)title action:(SEL)action target:(id)target object:(id)object
{
	NSParameterAssert(title);
	NSParameterAssert(action);
	NSParameterAssert(target);
	
	NSInteger index = [self addButtonWithTitle:title];
	if ( action && target ) {
		NSInvocation *invocation = [self invocationForAction:action target:target object:object];
		[self.data setValue:invocation forKey:title];
	}
	return index;
}

/*
 *
 *
 *
 */
- (NSRange)addButtonsWithTitles:(NSArray *)titles
{
	NSParameterAssert(titles);
	__block NSRange range = NSMakeRange(NSNotFound, titles.count);
	[titles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		NSInteger index = [self addButtonWithTitle:obj];
		if ( range.location == NSNotFound ) range.location = index;
	}];
	
	return range;
}

/*
 *
 *
 *
 */
- (void)dealloc
{
	WBRelease(_data);
	WBRelease(_actionSheet);
	[super dealloc];
}

/*
 *
 *
 *
 */
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
	NSParameterAssert(item);

	[self.actionSheet showFromBarButtonItem:item animated:animated];
}

/*
 *
 *
 *
 */
- (void)showFromToolbar:(UIToolbar *)toolbar
{
	NSParameterAssert(toolbar);

	[self.actionSheet showFromToolbar:toolbar];
}

/*
 *
 *
 *
 */
- (void)showFromTabBar:(UITabBar *)tabBar
{
	NSParameterAssert(tabBar);
	
	[self.actionSheet showFromTabBar:tabBar];
}

/*
 *
 *
 *
 */
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
	NSParameterAssert(view);
	NSParameterAssert(!CGRectIsEmpty(rect));
	
	[self.actionSheet showFromRect:rect inView:view animated:animated];
}

/*
 *
 *
 *
 */
- (void)showInView:(UIView *)view
{
	NSParameterAssert(view);
	
	[self.actionSheet showInView:view];
}

/*
 *
 *
 *
 */
- (void)dismiss
{
	[self dismissAnimated:NO];
}

/*
 *
 *
 *
 */
- (void)dismissAnimated:(BOOL)animated
{
	if ( self.isVisible ) {
		[self dismissWithClickedButtonIndex:self.cancelButtonIndex animated:animated];
	}
	else {
		[self cleanup];
	}
}

#if NS_BLOCKS_AVAILABLE
/*
 *
 *
 *
 */
- (void)prepareToShow
{
}

/*
 *
 *
 *
 */
- (void)showFromToolbar:(UIToolbar *)view completion:(WBActionSheetCompletion)completion
{
	NSParameterAssert(view);
	[self prepareToShow];
	if ( completion ) {
		_completion = Block_copy(completion);
	}
	[self.actionSheet showFromToolbar:view];
}

/*
 *
 *
 *
 */
- (void)showFromTabBar:(UITabBar *)view completion:(WBActionSheetCompletion)completion
{
	NSParameterAssert(view);
	[self prepareToShow];
	if ( completion ) {
		_completion = Block_copy(completion);
	}
	[self.actionSheet showFromTabBar:view];
}

/*
 *
 *
 *
 */
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completion:(WBActionSheetCompletion)completion
{
	NSParameterAssert(item);
	[self prepareToShow];
	if ( completion ) {
		_completion = Block_copy(completion);
	}
	[self.actionSheet showFromBarButtonItem:item animated:animated];
}

/*
 *
 *
 *
 */
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completion:(WBActionSheetCompletion)completion
{
	NSParameterAssert(view);
	NSParameterAssert(!CGRectIsEmpty(rect));
	[self prepareToShow];
	if ( completion ) {
		_completion = Block_copy(completion);
	}
	[self.actionSheet showFromRect:rect inView:view animated:animated];
}

/*
 *
 *
 *
 */
- (void)showInView:(UIView *)view completion:(WBActionSheetCompletion)completion
{
	NSParameterAssert(view);
	[self prepareToShow];
	if ( completion ) {
		_completion = Block_copy(completion);
	}
	[self.actionSheet showInView:view];
}
#endif

#pragma mark UIActionSheetDelegate Methods

//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//	if ( actionSheet != _actionSheet ) return;
//	
//	if ( _completion ) {
//		NSString * title = (buttonIndex >= 0) ? [actionSheet buttonTitleAtIndex:buttonIndex] : nil;
//		_completion(buttonIndex,title);
//	}
//	else {
//		NSString *title = [self buttonTitleAtIndex:buttonIndex];
//		NSInvocation *invocation = [self.data objectForKey:title];
//		if ( invocation && invocation != (NSInvocation *)[NSNull null] ) {
//			[invocation invoke];
//		}
//	}
//}

/*
 *
 *
 *
 */
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if ( actionSheet != _actionSheet ) return;
	
	if ( _completion ) {
		_completion(_actionSheet,buttonIndex);
	}
	else {
		NSString *title = [self buttonTitleAtIndex:buttonIndex];
		NSInvocation *invocation = [self.data objectForKey:title];
		if ( invocation && invocation != (NSInvocation *)[NSNull null] ) {
			[invocation invoke];
		}
	}

	if ( self.delegate && [self.delegate respondsToSelector:@selector(actionSheetCoordinatorDidFinish:)] ) {
		[self.delegate actionSheetCoordinatorDidFinish:self];
	}
	[self cleanup];
}


/*
 *
 *
 *
 */
- (id)forwardingTargetForSelector:(SEL)aSelector
{
	return self.actionSheet;
}
@end
