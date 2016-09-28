//
//  SafeMutableArray.m
//  analytics
//
//  Created by aignatiev on 15.09.16.
//  Copyright © 2016 aignatiev. All rights reserved.
//

#import "SafeMutableArray.h"

@interface SafeMutableArray () {
    __strong NSMutableArray* _arrayEmbedded;
}

@end

@implementation SafeMutableArray

#pragma mark - lifecycle

- (void)dealloc {
    _arrayEmbedded = nil;
}

#pragma mark - NSArray

- (instancetype)init {
    self = [super init];
    if (self) {
        _arrayEmbedded = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithObjects:(const id [])objects count:(NSUInteger)cnt {
    self = [super init];
    if (self) {
        _arrayEmbedded = [[NSMutableArray alloc] initWithObjects:objects count:cnt];
    }
    return self;
}

- (NSUInteger)count {
    @synchronized (_arrayEmbedded) {
        return [_arrayEmbedded count];
    }
}
- (id)objectAtIndex:(NSUInteger)index {
    @synchronized (_arrayEmbedded) {
        return [_arrayEmbedded objectAtIndex:index];
    }
}

#pragma mark - NSMutableArray

- (void)addObject:(id)anObject {
    @synchronized (_arrayEmbedded) {
        [_arrayEmbedded addObject:anObject];
    }
}
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    @synchronized (_arrayEmbedded) {
        [_arrayEmbedded insertObject:anObject atIndex:index];
    }
}
- (void)removeLastObject {
    @synchronized (_arrayEmbedded) {
        [_arrayEmbedded removeLastObject];
    }
}
- (void)removeObjectAtIndex:(NSUInteger)index {
    @synchronized (_arrayEmbedded) {
        [_arrayEmbedded removeObjectAtIndex:index];
    }
}
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    @synchronized (_arrayEmbedded) {
        [_arrayEmbedded replaceObjectAtIndex:index withObject:anObject];
    }
}

//#pragma mark - forward
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    SEL selector = [anInvocation selector];
//    DLog(@"sel:%@", NSStringFromSelector(selector));
//    @synchronized (_arrayEmbedded) {
//        [anInvocation invokeWithTarget:_arrayEmbedded];
//    }
//}
//
//- (BOOL)respondsToSelector:(SEL)aSelector {
//    DLog(@"sel:%@", NSStringFromSelector(aSelector));
//    return [super respondsToSelector:aSelector] || [_arrayEmbedded respondsToSelector:aSelector];
//}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
//    DLog(@"sel:%@", NSStringFromSelector(selector));
//    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
//    if (!signature) {
//        signature = [_arrayEmbedded methodSignatureForSelector:selector];
//    }
//    return signature;
//}

@end
