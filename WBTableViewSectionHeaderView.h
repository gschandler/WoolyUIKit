//
//  WBTableViewSectionHeaderView.h
//  WoolyTasks
//
//  Created by Scott Chandler on 6/8/09.
//  Copyright 2009 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WBTableViewSectionHeaderView : UIView {
	UILabel *_textLabel;
	NSArray *_gradientColors;
	UIColor *_topEdgeColor;
	UIColor *_bottomEdgeColor;
	CGGradientRef _gradient;
}
@property (nonatomic,strong,readonly) UILabel *textLabel;
@property (nonatomic,strong) NSArray *gradientColors;
@property (nonatomic,strong) UIColor *topEdgeColor;
@property (nonatomic,strong) UIColor *bottomEdgeColor;
@end
