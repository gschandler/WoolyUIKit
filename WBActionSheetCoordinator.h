//
//  WBActionSheetModerator.h
//  WBUtilities
//
//  Created by Scott Chandler on 12/20/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBActionSheetCoordinator;
@protocol WBActionSheetModeratorDelegate<NSObject>

- (void)actionSheetModeratorDidFinish:(WBActionSheetCoordinator *)actionSheetModerator;

@end

@interface WBActionSheetCoordinator : NSObject<UIActionSheetDelegate> {
	id<WBActionSheetModeratorDelegate>	_delegate;
	NSMutableDictionary *_data;
	UIActionSheet	*_actionSheet;
}
@property (nonatomic,assign) id<WBActionSheetModeratorDelegate> delegate;
@property (nonatomic,readonly,getter=isBusy) BOOL busy;

+ (WBActionSheetCoordinator *)sharedActionSheetCoordinator;

- (void)prepareSheet;
- (void)setTitle:(NSString *)title;
- (void)setCancelTitle:(NSString *)title action:(SEL)action target:(id)target object:(id)object;
- (void)setDestructiveTitle:(NSString *)title action:(SEL)action target:(id)target object:(id)object;
- (NSInteger)addOtherTitle:(NSString *)title action:(SEL)action target:(id)target object:(id)object;


- (void)cancel;
- (void)cancelAnimated:(BOOL)animated;

- (BOOL)invokeFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
- (BOOL)invokeFromToolbar:(UIToolbar *)toolbar animated:(BOOL)animated;
@end

