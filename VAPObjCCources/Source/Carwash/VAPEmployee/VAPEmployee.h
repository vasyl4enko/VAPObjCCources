//
//  VAPEmployee.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPObservable.h"
#import "VAPEmployeeObserver.h"
#import "VAPMoneyFlowing.h"

@class VAPEmployee;

typedef NS_ENUM(NSUInteger, VAPState) {
    VAPStateFree,
    VAPStateBeginWork,
    VAPStateEndWork
};

@interface VAPEmployee : VAPObservable <VAPEmployeeObserver, VAPMoneyFlowing>

@property (atomic, assign)              NSUInteger  wallet;
@property (atomic, assign)              VAPState    state;

- (void)processObject:(id<VAPMoneyFlowing>) object;
- (void)doJobWithObject:(id<VAPMoneyFlowing>)object;

- (SEL)selectorForState:(VAPState)state;

@end
