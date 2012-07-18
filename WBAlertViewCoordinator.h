//
//  WBAlertViewCoordinator.h
//  WoolyUI
//
//  Created by Scott Chandler on 7/14/12.
//  Copyright (c) 2012 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WBAlertViewCoordinator : NSObject

+ (WBAlertViewCoordinator *)sharedAlertViewCoordinator;

- (NSInteger)queueAlert:(UIAlertView *)alert contextInfo:(void *)contextInfo;
- (BOOL)showAlert:(UIAlertView *)alert contextInfo:(void *)contextInfo;

- (void *)contextInfoForAlert:(UIAlertView *)alert;

#if NS_BLOCKS_AVAILABLE
- (NSInteger)queueAlert:(UIAlertView *)alert completion:(void (^)(NSInteger buttonIndex))completion;
- (BOOL)showAlert:(UIAlertView *)alert completion:(void (^)(NSInteger buttonIndex))completion;
#endif

@end
