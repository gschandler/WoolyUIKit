//
//  WBTableViewController.h
//  WoolyTasks
//
//  Created by Scott Chandler on 4/30/09.
//  Copyright 2009 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBTableViewCellHandler.h"

@class WBTableViewCellHandler;
@class WBTableDefinition;

@interface WBTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
@private
	UITableView *_tableView;
	WBTableDefinition *_tableDefinition;
}

@property(nonatomic,retain) IBOutlet UITableView *tableView;
@property(nonatomic,retain) WBTableDefinition *tableDefinition;

- (void)reloadTable;

@end

@interface WBTableViewController(TableDefinition)
- (void)configureTableDefinition;
@end



extern NSString *kTableGroupsControllersKey;
extern NSString *kTableGroupsHeadersKey;
extern NSString *kTableGroupsFootersKey;
