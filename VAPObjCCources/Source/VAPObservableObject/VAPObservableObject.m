//
//  VAPObservableObject.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 01.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPObservableObject.h"

@interface VAPObservableObject ()
@property(nonatomic, retain)       NSMutableSet *mutableObservableObjects;

- (void)notifyObserversWithSelector:(SEL)selector;


@end

@implementation VAPObservableObject
@dynamic observableObjects;

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableObservableObjects = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservableObjects = [NSMutableSet set];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)observableObjects {
    return [[self.mutableObservableObjects copy] autorelease];
}

- (void)setState:(NSUInteger)state {
    if (_state != state) {
        _state = state;
        
        [self notifyObserversWithSelector:[self selectorForState:state]];
    }
    
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    [self.mutableObservableObjects addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.mutableObservableObjects removeObject:observer];
}

- (BOOL)cointainsObserver:(id)observer {
    return YES;
}

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    return NULL;
}

#pragma mark -
#pragma mark Private

-(void)notifyObserversWithSelector:(SEL)selector {
    NSSet *observableObjects = self.observableObjects;
    for (id object in observableObjects) {
        if ([object respondsToSelector:selector]) {
            [object performSelector:selector withObject:self];
        }
    }
}

@end
