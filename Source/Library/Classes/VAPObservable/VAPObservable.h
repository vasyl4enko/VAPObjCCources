//
//  VAPObservable.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 03.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAPObservable : NSObject
@property (nonatomic, assign)   NSInteger  state;

- (void)setState:(NSInteger)state withObject:(id)object;

- (void)addObserver:(id)object;
- (void)removeObserver:(id)object;

- (BOOL)containsObserver:(id)object;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;
//- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object withObject:(id)object2;

- (void)notifyObserversOnMainThreadWithSelector:(SEL)selector withObject:(id)object;

- (void)performBlock:(void (^)())block shouldNotify:(BOOL)shouldNotify;

- (SEL)selectorWithState:(NSInteger )state;

@end
