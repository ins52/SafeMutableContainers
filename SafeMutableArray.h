//
//  SafeMutableArray.h
//  analytics
//
//  Created by aignatiev on 15.09.16.
//  Copyright © 2016 aignatiev. All rights reserved.
//

#import <Foundation/Foundation.h>

// thread-safe NSMutableArray
// wrap all operations with @synchronized block
// implements only primitive methods. all others will relating to them
@interface SafeMutableArray : NSMutableArray

// NSArray
- (instancetype)init;
- (instancetype)initWithObjects:(const id [])objects count:(NSUInteger)cnt;
- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;

// NSMutableArray
- (void)addObject:(id)anObject;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end
