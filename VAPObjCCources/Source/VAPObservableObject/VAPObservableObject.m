//
//  VAPObservableObject.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 01.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPObservableObject.h"

@interface VAPObservableObject ()
@property(nonatomic, retain)       NSHashTable *mutableObservableObjects;

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
        self.mutableObservableObjects = [[NSHashTable alloc] initWithOptions:NSHashTableWeakMemory capacity:0];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)observableObjects {
    
    return [self.mutableObservableObjects allObjects];
}

- (void)setState:(NSUInteger)state {
        
        [self notifyObserversWithSelector:[self selectorForState:state]];
    
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    [self.mutableObservableObjects addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.mutableObservableObjects removeObject:observer];
}

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    return NULL;
}

#pragma mark -
#pragma mark Private

-(void)notifyObserversWithSelector:(SEL)selector {
    NSArray *observableObjects = [self.mutableObservableObjects allObjects];
    for (id object in observableObjects) {
        if ([object respondsToSelector:selector]) {
            [object performSelector:selector withObject:self];
        }
    }
}

@end
