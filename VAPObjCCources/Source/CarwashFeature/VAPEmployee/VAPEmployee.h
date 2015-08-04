//
//  VAPEmployee.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPObserver.h"
#import "VAPEmployeeObserver.h"
#import "VAPMoneyFlowingDelegate.h"
#import "VAPMoneyFlowing.h"

@class VAPEmployee;

typedef NS_ENUM(NSUInteger, VAPMoneyState) {
    VAPMoneyStateAdd,
    VAPMoneyStateLess
};

typedef NS_ENUM(NSUInteger, VAPBusyState) {
    VAPBusyStateFree,
    VAPBusyStateBeginWork,
    VAPBusyStateEndWork
};


@interface VAPEmployee : VAPObserver<VAPEmployeeObserver,VAPMoneyFlowing>

@property(nonatomic, retain)                    Class                           classType;
@property(nonatomic, retain)                    VAPEmployee                     *receiver;
@property(nonatomic, assign)                    NSUInteger                      wallet;
@property(nonatomic, assign, getter = isBusy)   BOOL                            busy;
@property(nonatomic, assign)                    NSUInteger                      busyState;

@property(nonatomic, assign)                    id<VAPMoneyFlowingDelegate>     delegate;

- (void)performEmployeeSpecificOperationWithObject:(id<VAPMoneyFlowing>) object;
- (SEL)selectorBusyForState:(NSUInteger)state;
- (void)delegateWithSelector:(SEL)selector;

@end
