//
//  WBTableViewSectionHeaderView.m
//  WoolyTasks
//
//  Created by Scott Chandler on 6/8/09.
//  Copyright 2009 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBTableViewSectionHeaderView.h"


@implementation WBTableViewSectionHeaderView
@synthesize gradientStartColor;
@synthesize gradientEndColor;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
	[gradientStartColor release];
	[gradientEndColor release];
	
	if ( gradient )
		CGGradientRelease(gradient);
	if ( firstLine )
		CGColorRelease(firstLine);
	if ( nextLine )
		CGColorRelease(nextLine);
	if ( lastLine )
		CGColorRelease(lastLine);
	
	[super dealloc];
}

-(void)drawRect:(CGRect)rect 
{
	if ( gradient == NULL ) {
		CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
		CGFloat colorComponents[][4] = {{118.0/255.0,136.0/255.0,136.0/255.0,1.0},{154.0/255.0,164.0/255.0,171.0/255.0,1.0}};
		CGColorRef startColor = CGColorCreate(colorSpace,colorComponents[0]);
		CGColorRef endColor = CGColorCreate(colorSpace,colorComponents[1]);
		
		CGFloat lineColorComponents[][4] = {
			{113.0/255.0,125.0/255.0,133.0/255.0,1.0},
			{160.0/255.0,170.0/255.0,180.0/255.0,1.0},
			{128.0/255.0,129.0/255.0,134.0/255.0,1.0}
		};
		firstLine = CGColorCreate(colorSpace,lineColorComponents[0]);
		nextLine = CGColorCreate(colorSpace,lineColorComponents[1]);
		lastLine = CGColorCreate(colorSpace,lineColorComponents[2]);
		
		if ( colorSpace ) CGColorSpaceRelease(colorSpace);
		
		const void *values[] = {startColor,endColor};
		CFArrayRef colors = CFArrayCreate(kCFAllocatorDefault, values, 2, &kCFTypeArrayCallBacks);
		if ( startColor ) CGColorRelease(startColor);
		if ( endColor ) CGColorRelease(endColor);
		gradient = CGGradientCreateWithColors( NULL, colors, NULL);
		if ( colors ) CFRelease(colors);
	}
	
	CGPoint startPoint = rect.origin;
	startPoint.y;
	CGPoint endPoint = rect.origin;
	endPoint.y += rect.size.height;
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSaveGState(context);
	CGContextClipToRect(context, rect);
	CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
	CGContextRestoreGState(context);
	
	//	CGContextBeginPath(context);
	CGContextSetStrokeColorWithColor(context,firstLine);
	CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
	CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect));
	CGContextStrokePath(context);
	//	CGContextClosePath(context);
	/*
	 CGContextSetStrokeColorWithColor(context,nextLine);
	 CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect)+1.0);
	 CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect)+1.0);
	 CGContextStrokePath(context);
	 */
	CGContextSetStrokeColorWithColor(context,lastLine);
	CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect));
	CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
	CGContextStrokePath(context);
	
	//	[super drawRect:rect];
}

@end
