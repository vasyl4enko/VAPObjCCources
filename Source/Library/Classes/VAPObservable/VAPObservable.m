//
//  VAPObservable.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 03.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPObservable.h"

#import "VAPDispatch.h"

@interface VAPObservable ()
@property (nonatomic, strong)   NSHashTable     *mutableObservers;
@property (nonatomic, assign)   BOOL            shouldNotify;

@end

@implementation VAPObservable

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSHashTable weakObjectsHashTable];
        self.shouldNotify = YES;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (void)setState:(NSInteger) state {
    [self setState:state withObject:nil];
}

- (void)setState:(NSInteger)state withObject:(id)object {
    if (_state != state) {
        _state = state;
    }
    
    if (self.shouldNotify) {
        [self notifyObserversWithSelector:[self selectorWithState:state] withObject:object];
    }
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



- (void)performBlock:(void (^)())block shouldNotify:(BOOL)shouldNotify {
    BOOL state = self.shouldNotify;
    self.shouldNotify = shouldNotify;
    if (block) {
        block();
    }
    
    self.shouldNotify = state;
}

- (SEL)selectorWithState:(NSInteger )state {
    return nil;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    NSArray *observers = [self.mutableObservers allObjects];
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
}

#pragma clang diagnostic pop

- (void)notifyObserversOnMainThreadWithSelector:(SEL)selector withObject:(id)object {
    VAPDispatchAsyncOnMainThread(^{
        [self notifyObserversWithSelector:selector withObject:object];
    });
}

@end
