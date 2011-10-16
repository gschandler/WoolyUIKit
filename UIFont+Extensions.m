//
//  UIFont+Extensions.m
//  Gigbook
//
//  Created by Scott Chandler on 4/10/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "UIFont+Extensions.h"


@implementation UIFont(WoolyBeast)

- (CGFloat)height
{
	return self.ascender - self.descender;
}

@end
