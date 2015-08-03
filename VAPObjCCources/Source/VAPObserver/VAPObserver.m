//
//  VAPObserver.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 03.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPObserver.h"

@interface VAPObserver ()
@property(nonatomic, retain)    NSHashTable     *mutableObservers;
@end

@implementation VAPObserver
@dynamic observers;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableObservers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [[[NSHashTable alloc] initWithOptions:NSHashTableWeakMemory capacity:1] autorelease];
    }
    
    return self;
}


#pragma mark -
#pragma mark Accessors 

- (void)setState:(NSUInteger)state {
        _state = state;
        [self notifyObserversWithSelectot:[self selectorForState:state]];
    
}

- (NSArray *)observers {
    return [self.mutableObservers allObjects];
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

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (void)notifyObserversWithSelectot:(SEL)selector {
    NSArray *observers = self.observers;
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}


@end
