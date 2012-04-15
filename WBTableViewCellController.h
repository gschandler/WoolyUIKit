//
//  WBTableViewCellController.h
//  WoolyTasks
//
//  Created by Scott Chandler on 5/2/09.
//  Copyright 2009 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WBTableViewCellController<NSObject>

@required

// configure a cell's content. called once upon creation of the cell.
- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

// update a cell's content. called often.
- (void)updateCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

// obtains existing cell if already exists, or calls createCellForRowAtIndexPath:inTableView:
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

@optional
- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

- (void)willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

- (NSIndexPath *)willSelectRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

- (NSIndexPath *)willDeselectRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;
- (void)didDeselectRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

- (void)accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

- (UITableViewCellEditingStyle)editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;
- (BOOL)shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;
- (BOOL)canEditRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

@end


enum {
	WBTableViewCellEventWillSelect = 1,
	WBTableViewCellEventDidSelect,
	WBTableViewCellEventWillDeselect,
	WBTableViewCellEventDidDeselect,
	WBTableViewCellEventAccessory
};
typedef NSUInteger WBTableViewCellEvents;

@interface WBTableViewCellController : NSObject<WBTableViewCellController>
{
	UIViewController *		_hostViewController;
	UIEdgeInsets			_contentInsets;
	NSMutableDictionary *	_targetActions;
}
@property (nonatomic,strong) UIViewController *hostViewController;

- (void)addTarget:(id)target action:(SEL)action forTableViewCellEvent:(WBTableViewCellEvents)event;
- (void)removeTarget:(id)target action:(SEL)action forTableViewCellEvent:(WBTableViewCellEvents)event;

@property(nonatomic,assign) UIEdgeInsets contentInsets;

@property(nonatomic,readonly) NSString *tableViewCellReuseIdentifier;
@property(nonatomic,readonly) Class tableViewCellClass;
@property(nonatomic,readonly) UITableViewCellStyle tableViewCellStyle;

- (CGRect)contentBoundsFromCell:(UITableViewCell *)cell;

- (UITableViewCell *)createCellForRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

@end

