//
//  VAPObservableObject.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 01.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAPObservableObject : NSObject
@property(nonatomic, readonly)      NSArray     *observableObjects;
@property(nonatomic, assign)        NSUInteger  state;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (BOOL)cointainsObserver:(id)observer;

- (SEL)selectorForState:(NSUInteger)state;


@end
