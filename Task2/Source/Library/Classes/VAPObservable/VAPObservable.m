//
//  VAPObservable.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 03.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPObservable.h"
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

@interface VAPObservable ()
@property(nonatomic, strong)    NSHashTable     *mutableObservers;
@end

@implementation VAPObservable

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Implementation

- (void)addObserver:(id)object {
    [self.mutableObservers addObject:object];
}
- (void)removeObserver:(id)object {
    [self.mutableObservers removeObject:object];
}

- (BOOL)containsObserver:(id)object {
    return [self.mutableObservers containsObject:object];
}

- (void)notifyObserversWithSelector:(SEL)selector {
    [self notifyObserversWithSelector:selector withObject:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    [self notifyObserversWithSelector:selector withObject:object withObject:nil];
}
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object withObject:(id)object2 {
    NSArray *observers = [self.mutableObservers allObjects];
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:object withObject:object2];
        }
    }
}

- (void)notifyObserversOnMainThreadWithSelector:(SEL)selector withObject:(id)object {
    NSArray *observers = [self.mutableObservers allObjects];
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelectorOnMainThread:selector withObject:object waitUntilDone:NO];
        }
    }
}

@end
