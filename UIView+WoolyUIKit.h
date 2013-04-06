//
//  UIView+WoolyUIKit.h
//  WoolyUI
//
//  Created by Scott Chandler on 8/30/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView(WoolyUIKit)

// rotation
- (void)rotateToDegrees:(CGFloat)angle;
- (void)rotateToRadians:(CGFloat)radians;
- (void)rotateByDegrees:(CGFloat)angle;
- (void)rotateByRadians:(CGFloat)radians;

// scaling
- (void)scaleToSize:(CGSize)size;
- (void)scaleBySize:(CGSize)size;

@end
