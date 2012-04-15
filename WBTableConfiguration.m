//
//  WBTableLayout.m
//  WoolyTasks
//
//  Created by Scott Chandler on 7/22/09.
//  Copyright 2009 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBTableConfiguration.h"

@implementation WBSectionHeaderFooter

@synthesize title=_title;
@synthesize view=_view;
@synthesize height=_height;


- (void)dealloc
{
	[_title release];
	[_view release];
	[super dealloc];
}

@end

@interface WBTableSection()
@property(nonatomic,copy) NSArray *controllers;
@end

@implementation WBTableSection
@synthesize header=_header;
@synthesize footer=_footer;
@synthesize controllers=_controllers;
@synthesize rowCount=_rowCount;
@synthesize tag=_tag;

-(id)init
{
	return [self initWithControllers:[NSArray array]];
}

- (id)initWithController:(id<WBTableViewCellController>)controller
{
	return [self initWithControllers:[NSArray arrayWithObjects:controller, nil]];
}

- (id)initWithControllers:(NSArray *)controllers
{
	self = [super init];
	if ( self ) {
		_tag = 0;
		_controllers = [[NSArray alloc] initWithArray:controllers];
		_rowCount = -1;
		_header = [WBSectionHeaderFooter new];
		_footer = [WBSectionHeaderFooter new];
	}
	return self;
	
}

- (void)dealloc
{
	[_controllers release];
	[_header release];
	[_footer release];
	[super dealloc];
}

- (NSInteger)numberOfRows
{
	NSInteger rows = self.rowCount;
	if ( rows == -1 ) {
		rows = [self.controllers count];
	}
	return rows;
}

- (void)addController:(id<WBTableViewCellController>)controller
{
	NSParameterAssert(controller);
	
	if ( [self.controllers containsObject:controller] == NO ) {
		self.controllers = [self.controllers arrayByAddingObject:controller];
	}
}

- (void)removeController:(id<WBTableViewCellController>)controller
{
	NSInteger index = [self.controllers indexOfObject:controller];
	if ( index != NSNotFound ) {
		NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:self.controllers];
		[temp removeObjectAtIndex:index];
		self.controllers = temp;
		[temp release];
	}
}

- (id<WBTableViewCellController>)controllerAtIndex:(NSInteger)index
{
	id<WBTableViewCellController> controller = nil;
	if ( [self.controllers count] > index ) {
		controller = [self.controllers objectAtIndex:index];
	}
	else if ([self.controllers count] > 0 ) {
		controller = [self.controllers lastObject];
	}
	return controller;
}

- (id<WBTableViewCellController>)firstController
{
	return [self.controllers objectAtIndex:0];
}

- (id<WBTableViewCellController>)lastController
{
	return [self.controllers lastObject];
}

- (NSInteger)indexOfController:(id<WBTableViewCellController>)controller
{
	NSParameterAssert(controller);
	return [self.controllers indexOfObject:controller];
}

- (NSEnumerator *)controllerEnumerator
{
	return [self.controllers objectEnumerator];
}


- (void)makeControllersPerformSelector:(SEL)selector
{
	[self.controllers makeObjectsPerformSelector:selector];
}

- (void)makeControllersPerformSelector:(SEL)selector withObject:(id)object
{
	[self.controllers makeObjectsPerformSelector:selector withObject:object];
}

@end

@implementation WBTableHeaderFooter

@synthesize view=_view;
@synthesize height=_height;

- (void)dealloc
{
	[_view release];
	[super dealloc];
}

@end



@interface WBTableConfiguration()
@property (nonatomic,copy) NSArray *sections;
@end



@implementation WBTableConfiguration
@synthesize header = _header;
@synthesize sections = _sections;
@synthesize footer = _footer;

- (id)init
{
	self = [self initWithTableSections:[NSArray array]];
	return self;
}

//- (id)initWithNumberOfSections:(NSInteger)count
//{
//	self = [super init];
//	if ( self ) {
//		_sections = [[NSMutableArray alloc] initWithCapacity:count];
//		_header = [WBTableHeaderFooter new];
//		_footer = [WBTableHeaderFooter new];
//	}
//	return self;
//}

- (id)initWithTableSections:(NSArray *)sections
{
	NSParameterAssert(sections);
	
	self = [super init];
	if ( self ) {
		_sections = [[NSArray alloc] initWithArray:sections];
		_header = [WBTableHeaderFooter new];
		_footer = [WBTableHeaderFooter new];
	}
	return self;
}

- (id)initWithTableSection:(WBTableSection *)section
{
	NSParameterAssert(section);

	return [self initWithTableSections:[NSArray arrayWithObject:section]];
}


- (void)dealloc
{
	[_header release];
	[_sections release];
	[_footer release];
	[super dealloc];
}

- (NSInteger)numberOfSections
{
	return [self.sections count];
}

- (WBTableSection *)sectionAtIndex:(NSInteger)index
{
	WBTableSection *section = nil;
	if ( [self numberOfSections] > index ) {
		section = [self.sections objectAtIndex:index];
	}
	return section;
}

- (WBTableSection *)sectionWithTag:(NSInteger)tag
{
	WBTableSection *section = nil;
	for ( WBTableSection *section in self.sections ) {
		if (section.tag == tag) break;
	}
	return section;
}


- (WBTableSection *)lastSection
{
	return ([self numberOfSections]>0) ? [self.sections lastObject] : nil;
}

- (WBTableSection *)firstSection
{
	return ([self numberOfSections]>0) ? [self.sections objectAtIndex:0] : nil;
}


- (void)addSection:(WBTableSection *)section
{
	NSParameterAssert(section);
	if ( [self.sections containsObject:section] == NO ) {
		self.sections = [self.sections arrayByAddingObject:section];
	}
}

- (void)insertSection:(WBTableSection *)section atIndex:(NSInteger)index
{
	NSParameterAssert(section);
	if ( [self numberOfSections] >= index ) {
		if ( [self.sections containsObject:section] == NO ) {
			NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:self.sections];
			[temp insertObject:section atIndex:index];
			self.sections = temp;
			[temp release];
		}
	}
}

- (void)removeSection:(WBTableSection *)section
{
	NSParameterAssert(section);
	NSInteger index = [self.sections indexOfObject:section];
	if ( index != NSNotFound ) {
		[self removeSectionAtIndex:index];
	}
}

- (void)removeSectionAtIndex:(NSInteger)index
{
	if ( [self numberOfSections] > index ) {
		NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:self.sections];
		[temp removeObjectAtIndex:index];
		self.sections = temp;
		[temp release];
	}
}

- (NSEnumerator *)sectionEnumerator
{
	return [self.sections objectEnumerator];
}


- (NSInteger)indexOfSection:(WBTableSection *)section
{
	NSParameterAssert(section);
	return [self.sections indexOfObject:section];
}

- (id<WBTableViewCellController>)controllerForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSParameterAssert(indexPath);
	NSAssert1(indexPath.section<self.sections.count,@"Invalid section index (%d)",indexPath.section);
	
	WBTableSection *section = [self.sections objectAtIndex:indexPath.section];
	id<WBTableViewCellController> controller = [section controllerAtIndex:indexPath.row];
	return controller;
}

- (NSIndexPath *)indexPathOfController:(id<WBTableViewCellController>)controller
{
	NSIndexPath *indexPath = nil;
	NSArray * result = [self.sections filteredArrayUsingPredicate:[NSComparisonPredicate predicateWithLeftExpression:[NSExpression expressionForKeyPath:@"controllers"]
																									 rightExpression:[NSExpression expressionForConstantValue:controller]
																									  customSelector:@selector(containsObject:)]];
	WBTableSection *tableSection = [result lastObject];
	if ( tableSection ) {
		NSInteger section = [self indexOfSection:tableSection];
		NSInteger row = [tableSection indexOfController:controller];
		indexPath = [NSIndexPath indexPathForRow:row inSection:section];
	}
	return indexPath;
}

- (void)makeControllersPerformSelector:(SEL)selector
{
	for ( WBTableSection *section in self.sections ) {
		[section makeControllersPerformSelector:selector];
	}
}

- (void)makeControllersPerformSelector:(SEL)selector withObject:(id)object
{
	for ( WBTableSection *section in self.sections ) {
		[section makeControllersPerformSelector:selector withObject:object];
	}
}

@end
