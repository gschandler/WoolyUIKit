//
//  WBActionSheetModerator.m
//  WBUtilities
//
//  Created by Scott Chandler on 12/20/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBActionSheetCoordinator.h"

static WBActionSheetCoordinator *gActionSheetModeratorSingleton = nil;

static NSString * const kCancelActionKey		= @"cancel";
static NSString * const kDestructiveActionKey	= @"destructive";
static NSString * const kOtherActionKey			= @"other";
static NSString * const kTitleKey				= @"title";
static NSString * const kActionKey				= @"action";

static NSString * const kStateKey				= @"state";
static NSString * const kStatePrepare			= @"prepare";
static NSString * const kStatePresented			= @"presented";
static NSString * const kStateDismissed			= @"dismissed";

@interface WBActionSheetCoordinator()
@property (nonatomic,readonly,retain) NSMutableDictionary *data;

- (NSInvocation *)invocationForAction:(SEL)action target:(id)target object:(id)object;
@end

@implementation WBActionSheetCoordinator
@synthesize delegate=_delegate;


+ (WBActionSheetCoordinator *)sharedActionSheetCoordinator
{
    if ( gActionSheetModeratorSingleton == nil ) {
        gActionSheetModeratorSingleton = [[super allocWithZone:NULL] init];
    }
    
    return gActionSheetModeratorSingleton;
}

+ (id)allocWithZone:(NSZone *)zone
{
	return [[self sharedActionSheetCoordinator] retain];
}

//- (id)copyWithZone:(NSZone *)zone
//{
//	return self;
//}

- (id)retain
{
	return self;
}

- (NSUInteger)retainCount
{
	return NSUIntegerMax;
}

- (oneway void)release
{
	// do nothing
}

- (id)autorelease
{
	return self;
}

- (BOOL)isBusy
{
    return _actionSheet != nil && _actionSheet.isVisible;
}


static NSString *const kActionTitleKey = @"title";
static NSString *const kActionInvocationKey = @"invocation";

- (UIActionSheet *)createActionSheet
{
    UIActionSheet *actionSheet = [[[UIActionSheet alloc] initWithTitle:[self.data objectForKey:kTitleKey]
                                                              delegate:self
                                                     cancelButtonTitle:nil
												destructiveButtonTitle:nil
                                                     otherButtonTitles:nil] autorelease];
    NSArray *otherButtons = [self.data objectForKey:kOtherActionKey];
    for ( NSDictionary *other in otherButtons ) {
        [actionSheet addButtonWithTitle:[other objectForKey:kActionTitleKey]];
    }
	if ( [self.data objectForKey:kDestructiveActionKey] ) {
		[actionSheet setDestructiveButtonIndex:[actionSheet addButtonWithTitle:[[self.data objectForKey:kDestructiveActionKey] objectForKey:kActionTitleKey]]];
	}
	if ( [self.data objectForKey:kCancelActionKey] ) {
		[actionSheet setCancelButtonIndex:[actionSheet addButtonWithTitle:[[self.data objectForKey:kCancelActionKey] objectForKey:kActionTitleKey]]];
	}
    return actionSheet;
                                  
}

- (NSMutableDictionary *)data
{
	if ( _data == nil ) {
		_data = [[NSMutableDictionary alloc] initWithCapacity:3];
		[_data setObject:[NSArray array] forKey:kOtherActionKey];
	}
	return _data;
}

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


- (void)prepareSheet
{
	[self.data removeAllObjects];
	[self.data setObject:kStatePrepare forKey:kStateKey];
	[self.data setObject:[NSArray array] forKey:kOtherActionKey];
}

- (void)setTitle:(NSString *)title
{
	NSAssert([[self.data objectForKey:kStateKey] isEqual:kStatePrepare],@"Can't alter title unless in Prepare state");
    [self.data setObject:title forKey:kTitleKey];
}

- (void)setCancelTitle:(NSString *)title action:(SEL)action target:(id)target object:(id)object
{
	NSParameterAssert(title);
	NSAssert([[self.data objectForKey:kStateKey] isEqual:kStatePrepare],@"Can't alter cancel title unless in Prepare state");
	NSInvocation *invocation = [self invocationForAction:action target:target object:object];
	[self.data setObject:[NSDictionary dictionaryWithObjectsAndKeys:title,kActionTitleKey,invocation,kActionInvocationKey, nil] forKey:kCancelActionKey];
}

- (void)setDestructiveTitle:(NSString *)title action:(SEL)action target:(id)target object:(id)object
{
	NSParameterAssert(title);
	NSAssert([[self.data objectForKey:kStateKey] isEqual:kStatePrepare],@"Can't alter destructive title unless in Prepare state");
	NSInvocation *invocation = [self invocationForAction:action target:target object:object];
	[self.data setObject:[NSDictionary dictionaryWithObjectsAndKeys:title,kActionTitleKey,invocation,kActionInvocationKey, nil] forKey:kDestructiveActionKey];
}

- (NSInteger)addOtherTitle:(NSString *)title action:(SEL)action target:(id)target object:(id)object
{
	NSParameterAssert(title);
	NSAssert([[self.data objectForKey:kStateKey] isEqual:kStatePrepare],@"Can't alter other title unless in Prepare state");
	NSInvocation *invocation = [self invocationForAction:action target:target object:object];
	
	NSArray *actions = [[self.data objectForKey:kOtherActionKey] arrayByAddingObject:[NSDictionary dictionaryWithObjectsAndKeys:title,kActionTitleKey,invocation,kActionInvocationKey, nil]];
	[self.data setObject:actions forKey:kOtherActionKey];
	return actions.count - 1;
}


- (void)dealloc
{
	WBRelease(_data);
	WBRelease(_actionSheet);
	[super dealloc];
}

- (BOOL)invokeFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
	NSAssert([[self.data objectForKey:kStateKey] isEqual:kStatePrepare],@"Can't invoke unless in Prepare state");
	if ( _actionSheet == nil ) {
   		[self.data setObject:kStatePresented forKey:kStateKey];
     _actionSheet = [self createActionSheet];
        [_actionSheet retain];
		[_actionSheet showFromBarButtonItem:item animated:animated];
        return YES;
	}
    else {
        return NO;
    }
}

- (BOOL)invokeFromToolbar:(UIToolbar *)toolbar animated:(BOOL)animated
{
	NSAssert([[self.data objectForKey:kStateKey] isEqual:kStatePrepare],@"Can't invoke unless in Prepare state");
	if ( _actionSheet == nil ) {
		[self.data setObject:kStatePresented forKey:kStateKey];
		_actionSheet = [self createActionSheet];
		[_actionSheet retain];
		[_actionSheet showFromToolbar:toolbar];
		return YES;
	}
	else {
		return NO;
	}
}


- (void)cancel
{
    [self cancelAnimated:NO];
}

- (void)cancelAnimated:(BOOL)animated
{
    if ( _actionSheet != nil ) {
        [_actionSheet dismissWithClickedButtonIndex:_actionSheet.cancelButtonIndex animated:animated];
    }
}

#pragma mark UIActionSheetDelegate Methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if ( actionSheet != _actionSheet ) return;
	
	NSInvocation *invocation = nil;
	if ( buttonIndex == actionSheet.cancelButtonIndex ) {
		invocation = [[self.data objectForKey:kCancelActionKey] objectForKey:kActionInvocationKey];
	}
	else if ( buttonIndex == actionSheet.destructiveButtonIndex ) {
		invocation = [[self.data objectForKey:kDestructiveActionKey] objectForKey:kActionInvocationKey];
	}
	else {
		NSInteger index = buttonIndex;
		if ( actionSheet.firstOtherButtonIndex > 0 )
			index -= actionSheet.firstOtherButtonIndex;
		NSArray *actions = [self.data objectForKey:kOtherActionKey];
		if ( actions.count > index ) {
            NSDictionary *action = [actions objectAtIndex:index];
            
			invocation = [action objectForKey:kActionInvocationKey];
            
		}
	}
	
	if ( invocation && invocation != (NSInvocation *)[NSNull null] ) {
		[invocation invoke];
	}
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if ( self.delegate && [self.delegate respondsToSelector:@selector(actionSheetModeratorDidFinish:)] ) {
		[self.delegate actionSheetModeratorDidFinish:self];
	}

	[_actionSheet release];
	_actionSheet = nil;

	[self.data setObject:kStateDismissed forKey:kStateKey];
	[self.data removeAllObjects];
}


@end
