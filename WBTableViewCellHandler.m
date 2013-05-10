//
//  WBTableViewCellHandler.m
//  WoolyTasks
//
//  Created by Scott Chandler on 5/2/09.
//  Copyright 2009 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBTableViewCellHandler.h"

NSString *WBTableViewCellHandlerDidChangeNotification = @"WBTableViewCellHandlerDidChangeNotification";


@interface WBTableViewCellHandler()
@property (nonatomic,retain,readonly) NSMutableDictionary *targetActions;

- (void)performTargetActionsForTableViewCellEvent:(WBTableViewCellEvents)event;

@end

@implementation WBTableViewCellHandler
@synthesize contentInsets=_contentInsets;
@synthesize delegate=_delegate;
@synthesize tag=_tag;
@synthesize tableViewCellTitle=_title;
@synthesize tableViewCellImage=_image;
@synthesize tableViewCellDetails=_details;

#define HORIZONTAL_INSET	(10.0)
#define VERTICAL_INSET		(5.0)

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (id)init
{
	self = [super init];
	if ( self ) {
		self.contentInsets = UIEdgeInsetsZero;
	}
	return self;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
-(void)dealloc
{
	[_title release];
	[_image release];
	[_details release];
	[super dealloc];
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (NSString *)tableViewCellReuseIdentifier
{
	return nil;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (Class)tableViewCellClass
{
	return [UITableViewCell class];
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (UITableViewCellStyle)tableViewCellStyle
{
	return UITableViewCellStyleDefault;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (UITableViewCellAccessoryType)tableViewCellAccessortType
{
	return UITableViewCellAccessoryNone;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (UITableViewCellAccessoryType)tableViewCellEditingAccessoryType
{
	return UITableViewCellAccessoryNone;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView
{
	NSParameterAssert(cell);
	NSParameterAssert(indexPath);
	NSParameterAssert(tableView);
	
	
	[cell layoutIfNeeded];
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)updateCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView
{
	NSParameterAssert(cell);
	NSParameterAssert(indexPath);
	NSParameterAssert(tableView);
	
	cell.textLabel.text = self.tableViewCellTitle;
	if ( cell.detailTextLabel ) {
		cell.detailTextLabel.text = self.tableViewCellDetails;
	}
	cell.imageView.image = self.tableViewCellImage;

	// subclassers do their magic
	[cell setNeedsDisplay];
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView
{
	NSParameterAssert(indexPath);
	NSParameterAssert(tableView);

	UITableViewCell * cell = nil;
	
	NSString *reuseIdentifier = [self tableViewCellReuseIdentifier];
	if ( reuseIdentifier ) {
		cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	}
	
	if (cell == nil) {
		cell = [self createCellForRowAtIndexPath:indexPath inTableView:tableView];
		[self configureCell:cell forRowAtIndexPath:indexPath inTableView:tableView];
	}
	
	[self updateCell:cell forRowAtIndexPath:indexPath inTableView:tableView];
	
	return cell;
}

#pragma mark Optional
//
//	Method:
//		
//
//	Synopsis:
//		
//
- (UITableViewCell *)createCellForRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView
{
	NSParameterAssert(indexPath);
	NSParameterAssert(tableView);
	
	NSString *reuseIdentifier = [self tableViewCellReuseIdentifier];	
	Class TableViewCellClass = [self tableViewCellClass];
	UITableViewCellStyle style = [self tableViewCellStyle];
	UITableViewCell *cell = [[[TableViewCellClass alloc] initWithStyle:style reuseIdentifier:reuseIdentifier] autorelease];
	return cell;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (CGRect)contentBoundsFromCell:(UITableViewCell *)cell
{
	CGRect contentBounds = UIEdgeInsetsInsetRect(cell.contentView.bounds, self.contentInsets);
	return contentBounds;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (NSIndexPath *)willSelectRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView
{
	[self performTargetActionsForTableViewCellEvent:WBTableViewCellEventWillSelect];
	return indexPath;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView
{
	[self performTargetActionsForTableViewCellEvent:WBTableViewCellEventDidSelect];
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	[self updateCell:cell forRowAtIndexPath:indexPath inTableView:tableView];
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (NSIndexPath *)willDeselectRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView
{
	[self performTargetActionsForTableViewCellEvent:WBTableViewCellEventWillDeselect];
	return indexPath;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)didDeselectRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView
{
	[self performTargetActionsForTableViewCellEvent:WBTableViewCellEventDidDeselect];
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	[self updateCell:cell forRowAtIndexPath:indexPath inTableView:tableView];
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView
{
	[self performTargetActionsForTableViewCellEvent:WBTableViewCellEventAccessory];
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (NSMutableDictionary *)targetActions
{
	if ( _targetActions == nil ) {
		_targetActions = [NSMutableDictionary new];
	}
	return _targetActions;
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)addTarget:(id)target action:(SEL)action forTableViewCellEvent:(WBTableViewCellEvents)event
{
	id key = [NSNumber numberWithUnsignedInteger:event];
	NSArray *invocations = [self.targetActions objectForKey:key];
	if ( !invocations ) {
		invocations = [NSArray array];
	}
	
	NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[target methodSignatureForSelector:action]];
	[invocation setSelector:action];
	[invocation setTarget:target];
	
	if ( [invocations containsObject:invocation] == NO ) {
		invocations = [invocations arrayByAddingObject:invocation];
	}
	[self.targetActions setObject:invocations forKey:key];
	
}

//
//	Method:
//		
//
//	Synopsis:
//		
//
- (void)removeTarget:(id)target action:(SEL)action forTableViewCellEvent:(WBTableViewCellEvents)event
{
	id key = [NSNumber numberWithUnsignedInteger:event];
	NSArray *invocations = [self.targetActions objectForKey:key];
	if ( invocations ) {
		NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[target methodSignatureForSelector:action]];
		[invocation setSelector:action];
		[invocation setTarget:target];
		if ( [invocations containsObject:invocation] ) {
			NSMutableArray *newInvocations = [[NSMutableArray alloc] initWithArray:invocations];
			[newInvocations removeObject:invocation];
			[self.targetActions setObject:[NSArray arrayWithArray:newInvocations]  forKey:key];
			[newInvocations release];
		}
	}
	
}

//
//	Method:
//		
//
//	Synopsis:
//
//
- (void)performTargetActionsForTableViewCellEvent:(WBTableViewCellEvents)event
{
	id key = [NSNumber numberWithUnsignedInteger:event];
	NSArray *invocations = [self.targetActions objectForKey:key];
	[invocations enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		NSMethodSignature *methodSignature = [obj methodSignature];
		NSInvocation *callingInvocation = [NSInvocation invocationWithMethodSignature:methodSignature];
		[callingInvocation setSelector:[obj selector]];
		NSUInteger argumentCount = methodSignature.numberOfArguments;
		
		if ( argumentCount > 2 ) {
			id object = self;
			[callingInvocation setArgument:&object atIndex:2];
		}
		
		[callingInvocation retainArguments];
		[callingInvocation invokeWithTarget:[obj target]];
	}];
}

//
//	Method:
//
//
//	Synopsis:
//
//
- (void)presentViewController:(UIViewController *)viewControllerToPresent
{
	if ( viewControllerToPresent && self.delegate && [self.delegate respondsToSelector:@selector(tableViewCellHandler:presentViewController:)]) {
		[self.delegate tableViewCellHandler:self presentViewController:viewControllerToPresent];
	}
}

//
//	Method:
//
//
//	Synopsis:
//
//
- (void)dismissViewController:(UIViewController *)viewControllerToDismiss
{
	if ( viewControllerToDismiss && self.delegate && [self.delegate respondsToSelector:@selector(tableViewCellHandler:dismissViewController:)]) {
		[self.delegate tableViewCellHandler:self dismissViewController:viewControllerToDismiss];
	}
}

@end
