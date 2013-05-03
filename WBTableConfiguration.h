//
//  WBTableConfiguration.h
//  WoolyTasks
//
//  Created by Scott Chandler on 7/22/09.
//  Copyright 2009 Wooly Beast Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBTableViewCellHandler;
@protocol WBTableViewCellHandler;

/*
 *
 *	WBSectionHeaderFooter
 *
 */
@interface WBSectionHeaderFooter : NSObject
{
	NSString *_title;
	UIView *_view;
	CGFloat _height;
}
@property(copy) NSString *title;
@property(strong) UIView *view;
@property(assign) CGFloat height;

@end


/*
 *
 *	WBTableSection
 *
 */
@interface WBTableSection : NSObject
{
	NSInteger					_tag;
	WBSectionHeaderFooter *		_header;
	WBSectionHeaderFooter *		_footer;
	NSArray *					_handlers;
	NSInteger					_rowCount;
}
@property(strong,readonly) WBSectionHeaderFooter *header;
@property(strong,readonly) WBSectionHeaderFooter *footer;
@property(nonatomic,assign) NSInteger rowCount;
@property(assign) NSInteger tag;
@property (strong,readonly) NSArray *mediators;

- (id)initWithTableViewCellHandlers:(NSArray *)handlers;

- (void)addTableViewCellHandler:(id<WBTableViewCellHandler>)handler;
- (void)removeTableViewCellHandler:(id<WBTableViewCellHandler>)handler;
- (id<WBTableViewCellHandler>)tableViewCellHandlerAtIndex:(NSInteger)index;
- (id<WBTableViewCellHandler>)firstTableViewCellHandler;
- (id<WBTableViewCellHandler>)lastTableViewCellHandler;

- (NSEnumerator *)tableViewCellHandlerEnumerator;

- (NSInteger)indexOfTableViewCellHandler:(id<WBTableViewCellHandler>)controller;

- (void)makeTableViewCellHandlersPerformSelector:(SEL)selector;
- (void)makeTableViewCellHandlersPerformSelector:(SEL)selector withObject:(id)object;

#if NS_BLOCKS_AVAILABLE
- (void)enumerateTableViewCellHandlers:(void (^)(id<WBTableViewCellHandler> handler, NSInteger idx, BOOL *stop))block;
#endif
@end


/*
 *
 *	WBTableHeaderFooter
 *
 */
@interface WBTableHeaderFooter : NSObject
{
	UIView *_view;
	CGFloat _height;
}

@property(strong) UIView *view;
@property(assign) CGFloat height;

@end



/*
 *
 *	WBTableConfiguration
 *
 */
@interface WBTableConfiguration : NSObject
{
	WBTableHeaderFooter *	_header;
	WBTableHeaderFooter *	_footer;
	NSArray *				_sections;
}
@property(strong,readonly) WBTableHeaderFooter *header;
@property(strong,readonly) WBTableHeaderFooter *footer;
@property (strong,readonly) NSArray *sections;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (id)initWithTableSections:(NSArray *)sections;

- (NSInteger)numberOfSections;
- (WBTableSection *)sectionAtIndex:(NSInteger)index;
- (WBTableSection *)sectionWithTag:(NSInteger)tag;
- (WBTableSection *)lastSection;
- (WBTableSection *)firstSection;
- (void)addSection:(WBTableSection *)section;
- (void)insertSection:(WBTableSection *)section atIndex:(NSInteger)index;
- (void)removeSection:(WBTableSection *)section;
- (void)removeSectionAtIndex:(NSInteger)index;

- (NSEnumerator *)sectionEnumerator;

- (NSInteger)indexOfSection:(WBTableSection *)section;

- (id<WBTableViewCellHandler>)tableViewCellHandlerForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)indexPathOfTableViewCellHandler:(id<WBTableViewCellHandler>)controller;

- (void)makeTableViewCellHandlersPerformSelector:(SEL)selector;
- (void)makeTableViewCellHandlersPerformSelector:(SEL)selector withObject:(id)object;

#if NS_BLOCKS_AVAILABLE
- (void)enumerateTableViewCellHandlers:(void (^)(id<WBTableViewCellHandler> handler, NSIndexPath *indexPath, BOOL *stop))block;
#endif
@end
