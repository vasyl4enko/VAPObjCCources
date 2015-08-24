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


@interface VAPEmployee : VAPObservable<VAPEmployeeObserver,VAPMoneyFlowing>

@property(nonatomic, assign)            NSUInteger  wallet;
@property(nonatomic, assign, readonly)  VAPState    state;

- (void)performEmployeeSpecificOperationWithObject:(id<VAPMoneyFlowing>) object;
- (void)performEmployeeSpecificOperationWithObjectInBackground:(id<VAPMoneyFlowing>)object;


- (void)beginJob;
- (void)doJobWithObject:(id<VAPMoneyFlowing>)object;
- (void)finishJob;

- (SEL)selectorForState:(VAPState)state;
- (void)mayBeFree;



@end
