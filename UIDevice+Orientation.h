//
//  UIDevice+Orientation.h
//  Gigbook
//
//  Created by Scott Chandler on 8/29/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIDevice(Orientation)
@property (nonatomic,readonly) BOOL	isLandscape;
@property (nonatomic,readonly) BOOL isPortrait;

- (CGAffineTransform)transform;

@end
