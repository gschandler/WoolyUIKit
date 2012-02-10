//
//  WBTableViewCellController.m
//  WoolyTasks
//
//  Created by Scott Chandler on 5/2/09.
//  Copyright 2009 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBTableViewCellController.h"

@interface WBTableViewCellController()
@property (nonatomic,retain,readonly) NSMutableDictionary *targetActions;

- (void)performTargetActionsForTableViewCellEvent:(WBTableViewCellEvents)event forRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

@end

@implementation WBTableViewCellController
@synthesize contentInsets=_contentInsets;

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
- (UITableViewCellAccessoryType) tableViewCellAccessoryType
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
- (UITableViewCellAccessoryType) tableViewCellEditingAccessoryType
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
-(UIView *) tableViewCellAccessoryView
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
- (UIView *) tableViewCellEditingAccessoryView
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
- (NSString *) stringForTextLabel
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
- (NSString *) stringForDetailTextLabel
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
- (UIImage *) imageForImageView
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
- (UITableViewCellSelectionStyle) tableViewCellSelectionStyle
{
	return UITableViewCellSelectionStyleBlue;
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
	
	cell.textLabel.text			= [self stringForTextLabel];
	cell.detailTextLabel.text	= [self stringForDetailTextLabel];
	cell.imageView.image		= [self imageForImageView];	

	cell.accessoryType			= [self tableViewCellAccessoryType];
	cell.accessoryView			= [self tableViewCellAccessoryView];
	
	cell.editingAccessoryType	= [self tableViewCellEditingAccessoryType];
	cell.editingAccessoryView	= [self tableViewCellEditingAccessoryView];

	cell.selectionStyle			= [self tableViewCellSelectionStyle];

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
	[self performTargetActionsForTableViewCellEvent:WBTableViewCellEventWillSelect forRowAtIndexPath:indexPath inTableView:tableView];
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
	[self performTargetActionsForTableViewCellEvent:WBTableViewCellEventDidSelect forRowAtIndexPath:indexPath inTableView:tableView];
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
	[self performTargetActionsForTableViewCellEvent:WBTableViewCellEventWillDeselect forRowAtIndexPath:indexPath inTableView:tableView];
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
	[self performTargetActionsForTableViewCellEvent:WBTableViewCellEventDidDeselect forRowAtIndexPath:indexPath inTableView:tableView];
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
	[self performTargetActionsForTableViewCellEvent:WBTableViewCellEventAccessory forRowAtIndexPath:indexPath inTableView:tableView];
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
- (void)performTargetActionsForTableViewCellEvent:(WBTableViewCellEvents)event forRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView
{
	id key = [NSNumber numberWithUnsignedInteger:event];
	NSArray *invocations = [self.targetActions objectForKey:key];
	for ( NSInvocation *invocation in invocations ) {
		NSMethodSignature *methodSignature = invocation.methodSignature;
		NSInvocation *callingInvocation = [NSInvocation invocationWithMethodSignature:methodSignature];
		[callingInvocation setTarget:invocation.target];
		[callingInvocation setSelector:invocation.selector];
		NSUInteger argumentCount = methodSignature.numberOfArguments;

		if ( argumentCount > 2 ) 
			[callingInvocation setArgument:&indexPath atIndex:2];

		if ( argumentCount > 3 )
			[callingInvocation setArgument:&tableView atIndex:3];
		
		[callingInvocation invoke];
	}
}

@end
