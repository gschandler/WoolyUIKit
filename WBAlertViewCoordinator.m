//
//  WBAlertViewCoordinator.m
//  WoolyUI
//
//  Created by Scott Chandler on 7/14/12.
//  Copyright (c) 2012 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBAlertViewCoordinator.h"


@interface WBAlertQueueItem : NSObject
@property (strong) UIAlertView *alert;
@property (assign) void * contextInfo;
@property (assign) id delegate;
@property (nonatomic,assign) void * completion;
@end



@interface WBAlertViewCoordinator()
@property (nonatomic,strong) NSMutableArray *queue;
- (WBAlertQueueItem *)queueItemForAlert:(UIAlertView *)alert;
- (void)queueItemWasCompleted:(WBAlertQueueItem *)item;
- (void)presentQueuedAlert;

@end


static WBAlertViewCoordinator *gSharedAlertViewCoordinator = nil;

@implementation WBAlertViewCoordinator
@synthesize queue=_queue;

//
//	Method:
//		
//
//	Synopsis:
//		
//
+ (WBAlertViewCoordinator *)sharedAlertViewCoordinator;
{
	if ( gSharedAlertViewCoordinator == nil ) {
		gSharedAlertViewCoordinator = [[super allocWithZone:NULL] init];
	}
	return gSharedAlertViewCoordinator;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
+ (id)allocWithZone:(NSZone *)zone
{
	return [[self sharedAlertViewCoordinator] retain];
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (id)retain
{
	return self;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (NSUInteger)retainCount
{
	return NSUIntegerMax;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (oneway void)release
{
	// do nothing
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (id)autorelease
{
	return self;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (id)init
{
	self = [super init];
	if ( self ) {
        _queue = [NSMutableArray new];
	}
	return self;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)dealloc
{
    WBRelease(_queue);
	[super dealloc];
}

#pragma mark -
- (void)presentQueuedAlert
{
    dispatch_async(dispatch_get_main_queue(), ^{
        @synchronized(self.queue) {
            WBAlertQueueItem *item = [self.queue lastObject];
            if ( !item.alert.isVisible ) {
                [item.alert show];
            }
        }
    });
}

- (WBAlertQueueItem *)queueItemForAlert:(UIAlertView *)alert
{
    WBAlertQueueItem *item = nil;
    @synchronized(self.queue) {
        item = [self.queue lastObject];
        if ( item.alert != alert ) {
            NSArray *alerts = [self.queue valueForKey:@"alert"];
            NSInteger index = [alerts indexOfObject:alert];
            if ( index != NSNotFound ) {
                item = [self.queue objectAtIndex:index];
            }
        }
    }
    return item;
}

- (void)queueItemWasCompleted:(WBAlertQueueItem *)item
{
    if ( item ) {
        @synchronized(self.queue) {
            [self.queue removeObject:item];
        }
        [self presentQueuedAlert];
    }
}

- (NSInteger)queueAlert:(UIAlertView *)alert contextInfo:(void *)contextInfo
{
    WBAlertQueueItem *item = [WBAlertQueueItem new];
    item.alert = alert;
    item.delegate = alert.delegate;
    alert.delegate = self;
    item.contextInfo = contextInfo;
    NSInteger index = NSNotFound;
    @synchronized(self.queue) {
        [self.queue insertObject:item atIndex:0];
        index = self.queue.count;
    }
    [item release];
    
    if ( index != NSNotFound ) {
        [self presentQueuedAlert];
    }
    return index;
}

- (BOOL)showAlert:(UIAlertView *)alert contextInfo:(void *)contextInfo
{
    BOOL success = NO;
    
    @synchronized(self.queue) {
        WBAlertQueueItem *item = [self.queue lastObject];
        if ( item != nil || !item.alert.isVisible ) {
            item = [WBAlertQueueItem new];
            item.alert = alert;
            item.delegate = alert.delegate;
            alert.delegate = self;
            item.contextInfo = contextInfo;
            [self.queue addObject:item];
            [item release];
            success = YES;
		}
    }
    
    if ( success ) {
        [self presentQueuedAlert];
    }
    
    return success;
}

- (void *)contextInfoForAlert:(UIAlertView *)alert
{
    void *contextInfo = [[self queueItemForAlert:alert] contextInfo];
    return contextInfo;
}

#if NS_BLOCKS_AVAILABLE
- (NSInteger)queueAlert:(UIAlertView *)alert completion:(void (^)(NSInteger))completion
{
    WBAlertQueueItem *item = [WBAlertQueueItem new];
    item.alert = alert;
    item.delegate = alert.delegate;
    alert.delegate = self;
    item.contextInfo = nil;
    item.completion = completion;
    NSInteger index = NSNotFound;
    @synchronized(self.queue) {
        [self.queue insertObject:item atIndex:0];
        index = self.queue.count;
    }
    [item release];
    
    if ( index != NSNotFound ) {
        [self presentQueuedAlert];
    }
    return index;
}

- (BOOL)showAlert:(UIAlertView *)alert completion:(void (^)(NSInteger))completion
{
    BOOL success = NO;
    
    @synchronized(self.queue) {
        WBAlertQueueItem *item = [self.queue lastObject];
        if ( item == nil || !item.alert.isVisible ) {
            item = [WBAlertQueueItem new];
            item.alert = alert;
            item.delegate = alert.delegate;
            alert.delegate = self;
            item.contextInfo = nil;
            item.completion = completion;
            [self.queue addObject:item];
            [item release];
            success = YES;
        }
    }

    if ( success ) {
        [self presentQueuedAlert];
    }
    return success;
}
#endif

#pragma mark -

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    WBAlertQueueItem *item = [self queueItemForAlert:alertView];
    if ( item && item.delegate && [item.delegate respondsToSelector:_cmd] ) {
        [item.delegate alertView:alertView clickedButtonAtIndex:buttonIndex];
    }
    
    if ( item ) {
        typedef void (^Completion)(NSInteger);
        Completion completion = item.completion;
        if ( completion) {
            completion(buttonIndex);
        }
    }

}

// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
// If not defined in the delegate, we simulate a click in the cancel button
- (void)alertViewCancel:(UIAlertView *)alertView
{
    WBAlertQueueItem *item = [self queueItemForAlert:alertView];
    if ( item && item.delegate && [item.delegate respondsToSelector:_cmd] ) {
        [item.delegate willPresentAlertView:alertView];
    }

    if ( item ) {
        typedef void (^Completion)(NSInteger);
        Completion completion = item.completion;
        if ( completion) {
            completion(alertView.cancelButtonIndex);
        }
    }

}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    WBAlertQueueItem *item = [self queueItemForAlert:alertView];
    if ( item && item.delegate && [item.delegate respondsToSelector:_cmd] ) {
        [item.delegate willPresentAlertView:alertView];
    }

}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    WBAlertQueueItem *item = [self queueItemForAlert:alertView];
    if ( item && item.delegate && [item.delegate respondsToSelector:_cmd] ) {
        [item.delegate didPresentAlertView:alertView];
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    WBAlertQueueItem *item = [self queueItemForAlert:alertView];
    if ( item && item.delegate && [item.delegate respondsToSelector:_cmd] ) {
        [item.delegate alertView:alertView willDismissWithButtonIndex:buttonIndex];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    WBAlertQueueItem *item = [self queueItemForAlert:alertView];
    if ( item && item.delegate && [item.delegate respondsToSelector:_cmd] ) {
        [item.delegate alertView:alertView didDismissWithButtonIndex:buttonIndex];
    }
    
    [self queueItemWasCompleted:item];
}

// Called after edits in any of the default fields added by the style
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    BOOL enable = YES;
    WBAlertQueueItem *item = [self queueItemForAlert:alertView];
    if ( item && item.delegate && [item.delegate respondsToSelector:_cmd] ) {
        enable = [item.delegate alertViewShouldEnableFirstOtherButton:alertView];
    }
    
    return enable;

}

@end


@implementation WBAlertQueueItem
@synthesize alert=_alert;
@synthesize delegate=_delegate;
@synthesize contextInfo=_contextInfo;
@synthesize completion=_completion;

- (void)dealloc
{
    if ( _completion ) {
        Block_release(_completion);
    }
    [super dealloc];
}

- (void)setCompletion:(void *)completion
{
    Block_release(_completion);
    _completion = Block_copy(completion);
}

@end