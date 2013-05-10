//
//  WBTableConfiguration.m
//  WoolyTasks
//
//  Created by Scott Chandler on 7/22/09.
//  Copyright 2009 Wooly Beast Software, LLC. All rights reserved.
//

#import "WBTableConfiguration.h"
#import "WBTableViewCellHandler.h"

@implementation WBSectionHeaderFooter

@synthesize title=_title;
@synthesize view=_view;
@synthesize height=_height;

/*
 *
 *
 *
 */
- (void)dealloc
{
	[_title release];
	[_view release];
	[super dealloc];
}

@end

@interface WBTableSection()
@property(strong) NSArray *handlers;
@end

@implementation WBTableSection
@synthesize header=_header;
@synthesize footer=_footer;
@synthesize handlers=_handlers;
@synthesize rowCount=_rowCount;
@synthesize tag=_tag;

/*
 *
 *
 *
 */
-(id)init
{
	return [self initWithTableViewCellHandlers:@[]];
}

/*
 *
 *
 *
 */
- (id)initWithTableViewCellHandlers:(NSArray *)handlers
{
	if ( self = [super init], self != nil ) {
		_tag = 0;
		_handlers = [handlers retain];
		_rowCount = 0;
		_header = [WBSectionHeaderFooter new];
		_footer = [WBSectionHeaderFooter new];
	}
	return self;
	
}

/*
 *
 *
 *
 */
- (void)dealloc
{
	[_handlers release];
	[_header release];
	[_footer release];
	[super dealloc];
}

/*
 *
 *
 *
 */
- (NSInteger)rowCount
{
	return (_rowCount>0) ? _rowCount : self.handlers.count;
}

/*
 *
 *
 *
 */
- (void)addTableViewCellHandler:(id<WBTableViewCellHandler>)handler
{
	NSParameterAssert(handler);
	
	if ( [self.handlers containsObject:handler] == NO ) {
		self.handlers = [self.handlers arrayByAddingObject:handler];
	}
}

/*
 *
 *
 *
 */
- (void)removeTableViewCellHandler:(id<WBTableViewCellHandler>)handler
{
	NSInteger index = [self.handlers indexOfObject:handler];
	if ( index != NSNotFound ) {
		NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:self.handlers];
		[temp removeObjectAtIndex:index];
		self.handlers = [NSArray arrayWithArray:temp];
		[temp release];
	}
}

/*
 *
 *
 *
 */
- (id<WBTableViewCellHandler>)tableViewCellHandlerAtIndex:(NSInteger)index
{
	id<WBTableViewCellHandler> controller = nil;
	if ( [self.handlers count] > index ) {
		controller = [self.handlers objectAtIndex:index];
	}
	else if ([self.handlers count] > 0 ) {
		controller = [self.handlers lastObject];
	}
	return controller;
}

/*
 *
 *
 *
 */
- (id<WBTableViewCellHandler>)firstTableViewCellHandler
{
	return [self.handlers objectAtIndex:0];
}

/*
 *
 *
 *
 */
- (id<WBTableViewCellHandler>)lastTableViewCellHandler
{
	return [self.handlers lastObject];
}

/*
 *
 *
 *
 */
- (NSInteger)indexOfTableViewCellHandler:(id<WBTableViewCellHandler>)handler
{
	NSParameterAssert(handler);
	return [self.handlers indexOfObject:handler];
}

/*
 *
 *
 *
 */
- (NSEnumerator *)tableViewCellHandlerEnumerator
{
	return [self.handlers objectEnumerator];
}

/*
 *
 *
 *
 */
- (void)makeTableViewCellHandlersPerformSelector:(SEL)selector
{
	[self.handlers makeObjectsPerformSelector:selector];
}

/*
 *
 *
 *
 */
- (void)makeTableViewCellHandlersPerformSelector:(SEL)selector withObject:(id)object
{
	[self.handlers makeObjectsPerformSelector:selector withObject:object];
}

/*
 *
 *
 *
 */
#if NS_BLOCKS_AVAILABLE
- (void)enumerateTableViewCellHandlers:(void (^)(id<WBTableViewCellHandler>, NSInteger, BOOL *))block
{
    [self.handlers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id<WBTableViewCellHandler> controller = (id<WBTableViewCellHandler>)obj;
        block(controller,idx,stop);
    }];
}
#endif
@end

@implementation WBTableHeaderFooter

@synthesize view=_view;
@synthesize height=_height;

/*
 *
 *
 *
 */
- (void)dealloc
{
	[_view release];
	[super dealloc];
}

@end



@interface WBTableConfiguration()
@property (strong) NSArray *sections;
@end



@implementation WBTableConfiguration
@synthesize header = _header;
@synthesize sections = _sections;
@synthesize footer = _footer;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	NSParameterAssert(dictionary);
	if ( self = [super init], self != nil ) {
		
	}
	return self;
}

/*
 *
 *
 *
 */
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

/*
 *
 *
 *
 */
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


/*
 *
 *
 *
 */
- (void)dealloc
{
	[_header release];
	[_sections release];
	[_footer release];
	[super dealloc];
}

/*
 *
 *
 *
 */
- (NSInteger)numberOfSections
{
	return [self.sections count];
}

/*
 *
 *
 *
 */
- (WBTableSection *)sectionAtIndex:(NSInteger)index
{
	WBTableSection *section = nil;
	if ( [self numberOfSections] > index ) {
		section = [self.sections objectAtIndex:index];
	}
	return section;
}

/*
 *
 *
 *
 */
- (WBTableSection *)sectionWithTag:(NSInteger)tag
{
	WBTableSection *section = nil;
	for ( WBTableSection *section in self.sections ) {
		if (section.tag == tag) break;
	}
	return section;
}


/*
 *
 *
 *
 */
- (WBTableSection *)lastSection
{
	return ([self numberOfSections]>0) ? [self.sections lastObject] : nil;
}

/*
 *
 *
 *
 */
- (WBTableSection *)firstSection
{
	return ([self numberOfSections]>0) ? [self.sections objectAtIndex:0] : nil;
}


/*
 *
 *
 *
 */
- (void)addSection:(WBTableSection *)section
{
	NSParameterAssert(section);
	if ( [self.sections containsObject:section] == NO ) {
		self.sections = [self.sections arrayByAddingObject:section];
	}
}

/*
 *
 *
 *
 */
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

/*
 *
 *
 *
 */
- (void)removeSection:(WBTableSection *)section
{
	NSParameterAssert(section);
	NSInteger index = [self.sections indexOfObject:section];
	if ( index != NSNotFound ) {
		[self removeSectionAtIndex:index];
	}
}

/*
 *
 *
 *
 */
- (void)removeSectionAtIndex:(NSInteger)index
{
	if ( [self numberOfSections] > index ) {
		NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:self.sections];
		[temp removeObjectAtIndex:index];
		self.sections = temp;
		[temp release];
	}
}

/*
 *
 *
 *
 */
- (NSEnumerator *)sectionEnumerator
{
	return [self.sections objectEnumerator];
}


/*
 *
 *
 *
 */
- (NSInteger)indexOfSection:(WBTableSection *)section
{
	NSParameterAssert(section);
	return [self.sections indexOfObject:section];
}

/*
 *
 *
 *
 */
- (id<WBTableViewCellHandler>)tableViewCellHandlerForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSParameterAssert(indexPath);
	NSAssert1(indexPath.section<self.sections.count,@"Invalid section index (%d)",indexPath.section);
	
	WBTableSection *section = [self.sections objectAtIndex:indexPath.section];
	id<WBTableViewCellHandler> controller = [section tableViewCellHandlerAtIndex:indexPath.row];
	return controller;
}

/*
 *
 *
 *
 */
- (NSIndexPath *)indexPathOfTableViewCellHandler:(id<WBTableViewCellHandler>)handler
{
	NSIndexPath *indexPath = nil;
	NSArray * result = [self.sections filteredArrayUsingPredicate:
						[NSComparisonPredicate predicateWithLeftExpression:[NSExpression expressionForKeyPath:NSStringFromSelector(@selector(handlers))]
														   rightExpression:[NSExpression expressionForConstantValue:handler]
															customSelector:@selector(containsObject:)]];
	
	WBTableSection *tableSection = [result lastObject];
	if ( tableSection ) {
		NSInteger section = [self indexOfSection:tableSection];
		NSInteger row = [tableSection indexOfTableViewCellHandler:handler];
		indexPath = [NSIndexPath indexPathForRow:row inSection:section];
	}
	return indexPath;
}

/*
 *
 *
 *
 */
- (void)makeTableViewCellHandlersPerformSelector:(SEL)selector
{
	for ( WBTableSection *section in self.sections ) {
		[section makeTableViewCellHandlersPerformSelector:selector];
	}
}

/*
 *
 *
 *
 */
- (void)makeTableViewCellHandlersPerformSelector:(SEL)selector withObject:(id)object
{
	for ( WBTableSection *section in self.sections ) {
		[section makeTableViewCellHandlersPerformSelector:selector withObject:object];
	}
}

/*
 *
 *
 *
 */
#if NS_BLOCKS_AVAILABLE
- (void)enumerateTableViewCellHandlers:(void (^)(id<WBTableViewCellHandler>, NSIndexPath *, BOOL *))block
{
    NSParameterAssert(block);
    [self.sections enumerateObjectsUsingBlock:^(id sectionObj, NSUInteger sectionIndex, BOOL *stopOuter) {
        WBTableSection *section = (WBTableSection *)sectionObj;
        [section enumerateTableViewCellHandlers:^(id<WBTableViewCellHandler> controller, NSInteger rowIndex, BOOL *stopInner) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex];
            block(controller,indexPath,stopInner);
            *stopOuter = *stopInner;
        }];
    }];

}
#endif
@end
