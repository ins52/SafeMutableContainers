//
//  SafeMutableDictionary.m
//  analytics
//
//  Created by aignatiev on 15.09.16.
//  Copyright © 2016 aignatiev. All rights reserved.
//

#import "SafeMutableDictionary.h"

@interface SafeMutableDictionary () {
    __strong NSMutableDictionary* _dictEmbedded;
}

@end

@implementation SafeMutableDictionary

#pragma mark - lifecycle 

- (void)dealloc {
    _dictEmbedded = nil;
}

#pragma mark - NSDictionary

- (instancetype)init {
    self = [super init];
    if (self) {
        _dictEmbedded = [NSMutableDictionary new];
    }
    return self;
}

- (instancetype)initWithObjects:(const id [])objects forKeys:(const id<NSCopying>[])keys count:(NSUInteger)cnt {
    self = [super init];
    if (self) {
        _dictEmbedded = [[NSMutableDictionary alloc] initWithObjects:objects forKeys:keys count:cnt];
    }
    return self;
}

- (NSUInteger)count {
    @synchronized (_dictEmbedded) {
        return [_dictEmbedded count];
    }
}
- (id)objectForKey:(id)key{
    @synchronized (_dictEmbedded) {
        return [_dictEmbedded objectForKey:key];
    }
}
- (NSEnumerator*)keyEnumerator {
    @synchronized (_dictEmbedded) {
        return [_dictEmbedded keyEnumerator];
    }
}

#pragma mark - NSMutableDictionary

- (void)removeObjectForKey:(id)key {
    @synchronized (_dictEmbedded) {
        [_dictEmbedded removeObjectForKey:key];
    }
}
- (void)setObject:(id)obj forKey:(id)key {
    @synchronized (_dictEmbedded) {
        [_dictEmbedded setObject:obj forKey:key];
    }
}

//#pragma mark - forward
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    SEL selector = [anInvocation selector];
//    DLog(@"sel:%@", NSStringFromSelector(selector));
//    @synchronized (_dictEmbedded) {
//        [anInvocation invokeWithTarget:_dictEmbedded];
//    }
//}
//
//- (BOOL)respondsToSelector:(SEL)aSelector {
//    DLog(@"sel:%@", NSStringFromSelector(aSelector));
//    return [super respondsToSelector:aSelector] || [_dictEmbedded respondsToSelector:aSelector];
//}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
//    DLog(@"sel:%@", NSStringFromSelector(selector));
//    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
//    if (!signature) {
//        signature = [_dictEmbedded methodSignatureForSelector:selector];
//    }
//    return signature;
//}

@end
