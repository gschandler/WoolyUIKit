//
//  WBPopoverModerator.h
//  WBUtilities
//
//  Created by Scott Chandler on 12/21/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBPopoverCoordinator;

@protocol WBPopoverModeratorDelegate<NSObject>
@optional
- (BOOL)popoverModerator:(WBPopoverCoordinator *)pm shouldDismissPopoverController:(UIPopoverController *)pc;

- (void)popoverModerator:(WBPopoverCoordinator *)pm didDismissPopoverController:(UIPopoverController *)pc;

@end


@interface WBPopoverCoordinator : NSObject<UIPopoverControllerDelegate> {
	id<WBPopoverModeratorDelegate>	_delegate;
	UIPopoverController *			_popoverController;
}

@property (nonatomic,assign) id<WBPopoverModeratorDelegate> delegate;
@property (nonatomic,retain) UIPopoverController *popoverController;

+ (WBPopoverCoordinator *)sharedPopoverCoordinator;

- (void)dismissPopoverAnimated:(BOOL)animated;
- (void)dismissPopoverWithDelay:(NSTimeInterval)delay animated:(BOOL)animated;
- (void)cancelDismissPopoverWithDelay;

- (void)presentPopover:(UIPopoverController *)pc fromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated;
- (void)presentPopover:(UIPopoverController *)pc fromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated;

- (void)presentPopoverWithViewController:(UIViewController *)viewController fromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated;
- (void)presentPopoverWithViewController:(UIViewController *)viewController fromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated;

@end
