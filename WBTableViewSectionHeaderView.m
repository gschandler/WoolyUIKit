//
//  WBTableViewSectionHeaderView.m
//  WoolyTasks
//
//  Created by Scott Chandler on 6/8/09.
//  Copyright 2009 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBTableViewSectionHeaderView.h"


@implementation WBTableViewSectionHeaderView
@synthesize gradientColors=_gradientColors;
@synthesize topEdgeColor=_topEdgeColor;
@synthesize bottomEdgeColor=_bottomEdgeColor;
@synthesize textLabel=_textLabel;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame], self != nil) {
        // Initialization code
		
    }
    return self;
}

- (void)dealloc
{
	if ( _gradient )
		CGGradientRelease(_gradient);
	[_gradientColors release];
	[_topEdgeColor release];
	[_bottomEdgeColor release];
	[_textLabel release];
	[super dealloc];
}

- (UILabel *)textLabel
{
	if ( _textLabel == nil ) {
		UIFont *font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
		CGRect rect = CGRectInset(self.bounds, 10.0, 0.0);
		rect.size.height = [font lineHeight];
		
		_textLabel = [[UILabel alloc] initWithFrame:rect];
		_textLabel.textColor = [UIColor whiteColor];
		_textLabel.backgroundColor = [UIColor clearColor];
		_textLabel.font = font;
		_textLabel.shadowOffset = (CGSize){0.0,1.0};
		_textLabel.shadowColor = [UIColor darkGrayColor];
		_textLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
		_textLabel.center = (CGPoint){CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds)};
		[self addSubview:_textLabel];
	}
	return _textLabel;
}

- (void)setGradientColors:(NSArray *)colors
{
	if ( colors != _gradientColors) {
		[_gradientColors release];
		_gradientColors = [colors retain];
		if ( _gradient ) {
			CGGradientRelease(_gradient);
			_gradient = NULL;
		}
		[self setNeedsDisplay];
	}
}

- (void)setTopEdgeColor:(UIColor *)color
{
	if ( _topEdgeColor != color ) {
		[_topEdgeColor release];
		_topEdgeColor = [color retain];
		[self setNeedsDisplay];
	}
}

- (void)setBottomEdgeColor:(UIColor *)color
{
	if ( _bottomEdgeColor != color ) {
		[_bottomEdgeColor release];
		_bottomEdgeColor = [color retain];
		[self setNeedsDisplay];
	}
}

-(void)drawRect:(CGRect)rect 
{
	if ( _gradient == NULL && self.gradientColors.count > 0) {
		NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:self.gradientColors.count];
		[self.gradientColors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			[colors addObject:(id)[obj CGColor]];
		}];
		_gradient = CGGradientCreateWithColors( NULL, (CFArrayRef)colors, NULL);
		[colors release];
	}
	
	CGPoint startPoint = rect.origin;
	CGPoint endPoint = rect.origin;
	endPoint.y += rect.size.height;
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	if ( _gradient ) {
		CGContextSaveGState(context);
		CGContextClipToRect(context, rect);
		CGContextDrawLinearGradient(context, _gradient, startPoint, endPoint, 0);
		CGContextRestoreGState(context);
	}
	
	if ( _topEdgeColor ) {
		[_topEdgeColor setStroke];
		UIBezierPath *path = [UIBezierPath bezierPath];
		[path moveToPoint:startPoint];
		[path addLineToPoint:(CGPoint){startPoint.x+CGRectGetWidth(rect),startPoint.y}];
		[path stroke];
	}
	
	if ( _bottomEdgeColor ) {
		[_bottomEdgeColor setStroke];
		UIBezierPath *path = [UIBezierPath bezierPath];
		[path moveToPoint:endPoint];
		[path addLineToPoint:(CGPoint){endPoint.x+CGRectGetWidth(rect),endPoint.y}];
		[path stroke];
	}
}

@end
