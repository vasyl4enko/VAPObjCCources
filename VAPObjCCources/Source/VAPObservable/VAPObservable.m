//
//  VAPObservable.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 03.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPObservable.h"

@interface VAPObservable ()
@property(nonatomic, retain)    NSHashTable     *mutableObservers;
@end

@implementation VAPObservable

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableObservers = nil;
    
    [super dealloc];
}

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
    @synchronized(self.mutableObservers) {
        [self.mutableObservers addObject:object];
        
    }
}
- (void)removeObserver:(id)object {
    @synchronized(self.mutableObservers) {
        [self.mutableObservers removeObject:object];
    }
}

- (BOOL)containsObserver:(id)object {
    @synchronized(self.mutableObservers) {
        return [self.mutableObservers containsObject:object];
    }
}

- (void)notifyObserversWithSelector:(SEL)selector {
    [self notifyObserversWithSelector:selector withObject:self];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    [self notifyObserversWithSelector:selector withObject:self withObject:object];
}
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object withObject:(id)object2 {
    @synchronized(self.mutableObservers) {
        NSArray *observers = [self.mutableObservers allObjects];
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:object withObject:object2];
            }
        }
    }
}

- (void)notifyObserversOnMainThreadWithSelector:(SEL)selector withObject:(id)object {
    NSArray *observers = [self.mutableObservers allObjects];
    @synchronized(observers) {
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
            }
        }
    }
}
@end
