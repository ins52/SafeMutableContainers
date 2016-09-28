//
//  SafeMutableDictionary.h
//  analytics
//
//  Created by aignatiev on 15.09.16.
//  Copyright © 2016 aignatiev. All rights reserved.
//

#import <Foundation/Foundation.h>

// thread-safe nsmutabledictionary
// wrap all operations with @synchronized block
// implements only primitive methods. all others will relating to them
@interface SafeMutableDictionary : NSMutableDictionary

// NSDictionary
- (instancetype)init;
- (instancetype)initWithObjects:(const id [])objects forKeys:(const id<NSCopying>[])keys count:(NSUInteger)cnt;
- (NSUInteger)count;
- (id)objectForKey:(id)key;
- (NSEnumerator*)keyEnumerator;

// NSMutableDictionary
- (void)removeObjectForKey:(id)key;
- (void)setObject:(id)obj forKey:(id)key;

@end
