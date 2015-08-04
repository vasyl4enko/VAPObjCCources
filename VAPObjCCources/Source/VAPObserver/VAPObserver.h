//
//  VAPObserver.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 03.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAPObserver : NSObject

@property(nonatomic, assign)    NSUInteger  state;

- (void)addObserver:(id)object;
- (void)removeObserver:(id)object;

- (BOOL)containsObserver:(id)object;

- (SEL)selectorForState:(NSUInteger)state;


@end
