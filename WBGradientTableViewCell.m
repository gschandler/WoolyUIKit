//
//  WBGradientTableViewCell.m
//  WoolyUI
//
//  Created by Scott Chandler on 7/2/12.
//  Copyright (c) 2012 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBGradientTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation WBGradientTableViewCell
@synthesize gradientStops=_gradientStops;
@synthesize gradientColors=_gradientColors;

+ (Class)layerClass
{
    return [CAGradientLayer class];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setGradientColors:(NSArray *)gradientColors
{
    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    layer.colors = gradientColors;
    [layer setNeedsDisplay];
}

- (NSArray *)gradientColors
{
    return ((CAGradientLayer *)self.layer).colors;
}

- (void)setGradientStops:(NSArray *)gradientStops
{
    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    layer.locations = gradientStops;
    [layer setNeedsDisplay];
}

- (NSArray *)gradientStops
{
    return ((CAGradientLayer *)self.layer).locations;
}
@end