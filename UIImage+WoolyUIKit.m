//
//  UIImage+WoolyUIKit.m
//
//	The MIT License (MIT)
//
//	Copyright (c) 2013 Wooly Beast Software
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "UIImage+WoolyUIKit.h"


@implementation UIImage (WoolyUIKit)
/*
 *
 *
 *
 */
- (UIImage *)stretchableImageWithLeftCapPercent:(CGFloat)leftCapPercent topCapPercent:(CGFloat)topCapPercent
{
    NSParameterAssert(leftCapPercent>=0.0 && leftCapPercent<=1.0);
    NSParameterAssert(topCapPercent>=0.0 && topCapPercent<=1.0);
    
    CGSize size = self.size;
    UIImage *image = [self stretchableImageWithLeftCapWidth:lrintf(size.width * leftCapPercent) topCapHeight:lrintf(size.height * topCapPercent)];
    return image;
}

/*
 *
 *
 *
 */
+ (UIImage *)stretchableImageNamed:(NSString *)name leftCapPercent:(CGFloat)leftCapPercent topCapPercent:(CGFloat)topCapPercent
{
    NSParameterAssert(name);
    
    UIImage *image = [UIImage imageNamed:name];
    NSAssert(image,@"Invalid UIImage object (nil)");
    CGSize imageSize = image.size;
    
    image = [image stretchableImageWithLeftCapWidth:imageSize.width * leftCapPercent topCapHeight:imageSize.height * topCapPercent];
    
    return image;
}

/*
 *
 *
 *
 */
+ (UIImage *)stretchableImageNamed:(NSString *)name leftCapWidth:(NSUInteger)leftCapWidth topCapHeight:(NSUInteger)topCapHeight
{
    NSParameterAssert(name);
    UIImage *image = [UIImage imageNamed:name];
    NSAssert(image!=nil,@"Invalid UIImage object (nil)");
    image = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    return image;    
}

/*
 *
 *
 *
 */
+ (NSArray *)imagesWithNames:(NSArray *)names
{
	NSParameterAssert(names);
	NSMutableArray *images = [NSMutableArray arrayWithCapacity:names.count];
	for (NSString *name in names ) {
		[images addObject:[UIImage imageNamed:name]];
	}
	return [NSArray arrayWithArray:images];
}

/*
 *
 *
 *
 */
+ (NSArray *)imagesWithContentsOfFiles:(NSArray *)paths
{
	NSParameterAssert(paths);
	
	NSMutableArray *images = [NSMutableArray arrayWithCapacity:paths.count];
	for ( id path in paths ) {
		UIImage *image = nil;
		
		if ( [path isKindOfClass:[NSURL class]] ) {
			image = [UIImage imageWithContentsOfFile:[path path]];
		}
		else {
			image = [UIImage imageWithContentsOfFile:path];
		}
		
		if ( image ) {
			[images addObject:image];
		}
	}
	return [NSArray arrayWithArray:images];
}
@end
