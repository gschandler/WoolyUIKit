//
//  WBTableViewSectionHeaderView.h
//  WoolyTasks
//
//  Created by Scott Chandler on 6/8/09.
//  Copyright 2009 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WBTableViewSectionHeaderView : UIView {
	UIColor *gradientStartColor;
	UIColor *gradientEndColor;
	CGGradientRef gradient;
	CGColorRef firstLine;
	CGColorRef nextLine;
	CGColorRef lastLine;
	
}
@property(nonatomic,retain)	UIColor *gradientStartColor;
@property(nonatomic,retain)	UIColor *gradientEndColor;

@end
