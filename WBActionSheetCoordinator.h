//
//  WBActionSheetModerator.h
//  WBUtilities
//
//  Created by Scott Chandler on 12/20/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {
	WBActionSheetPrepareState = 0,
	WBActionSheetPresentedState,
	WBActionSheetDismissedState
};
typedef NSUInteger WBActionSheetState;

@class WBActionSheetCoordinator;

//
//	Delegate Protocol
//
@protocol WBActionSheetModeratorDelegate<NSObject>
@optional
- (void)actionSheetCoordinatorDidFinish:(WBActionSheetCoordinator *)actionSheetModerator;

@end


#if NS_BLOCKS_AVAILABLE
typedef void (^WBActionSheetCompletion)(NSUInteger buttonIndex, NSString *buttonTitle);
#endif

//
// Class declaration
//
@interface WBActionSheetCoordinator : NSObject<UIActionSheetDelegate> {
	id<WBActionSheetModeratorDelegate>	_delegate;
	id									_data;
	UIActionSheet						*_actionSheet;
#if NS_BLOCKS_AVAILABLE
	WBActionSheetCompletion				_completion;
#endif
}
@property (nonatomic,assign) id<WBActionSheetModeratorDelegate> delegate;

+ (WBActionSheetCoordinator *)sharedActionSheetCoordinator;

- (NSInteger)addButtonWithTitle:(NSString *)title action:(SEL)action target:(id)target object:(id)object;

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
- (void)showFromToolbar:(UIToolbar *)toolbar;
- (void)showFromTabBar:(UITabBar *)tabBar;
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated;
- (void)showInView:(UIView *)view;

#if NS_BLOCKS_AVAILABLE
- (void)showFromToolbar:(UIToolbar *)view completion:(WBActionSheetCompletion)completion;
- (void)showFromTabBar:(UITabBar *)view completion:(WBActionSheetCompletion)completion;
- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completion:(WBActionSheetCompletion)completion;
- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completion:(WBActionSheetCompletion)completion;
- (void)showInView:(UIView *)view completion:(WBActionSheetCompletion)completion;
#endif

- (void)dismiss;
- (void)dismissAnimated:(BOOL)animated;

- (NSRange)addButtonsWithTitles:(NSArray *)titles;
@end


@interface WBActionSheetCoordinator(Forwarding)
@property(nonatomic,copy) NSString *title;
@property(nonatomic) UIActionSheetStyle actionSheetStyle; // default is UIActionSheetStyleAutomatic. ignored if alert is visible

// adds a button with the title. returns the index (0 based) of where it was added. buttons are displayed in the order added except for the
// destructive and cancel button which will be positioned based on HI requirements. buttons cannot be customized.
- (NSInteger)addButtonWithTitle:(NSString *)title;    // returns index of button. 0 based.
- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex;
@property(nonatomic,readonly) NSInteger numberOfButtons;
@property(nonatomic) NSInteger cancelButtonIndex;      // if the delegate does not implement -actionSheetCancel:, we pretend this button was clicked on. default is -1
@property(nonatomic) NSInteger destructiveButtonIndex;        // sets destructive (red) button. -1 means none set. default is -1. ignored if only one button

@property(nonatomic,readonly) NSInteger firstOtherButtonIndex;	// -1 if no otherButtonTitles or initWithTitle:... not used
@property(nonatomic,readonly,getter=isVisible) BOOL visible;

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated;
@end