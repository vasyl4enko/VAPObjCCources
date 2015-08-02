//
//  VAPEmployee.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VAPEmployee;

@protocol VAPMoneyFlowingDelegate <NSObject>

- (void)delegatingEmployeeDidAddMoney:(VAPEmployee *)employee;

@end

@interface VAPEmployee : NSObject

@property(nonatomic, retain)                    VAPEmployee                     *receiver;
@property(nonatomic, assign)                    NSUInteger                      wallet;
@property(nonatomic, assign, getter = isBusy)   BOOL                            busy;
@property(nonatomic, assign)                    id<VAPMoneyFlowingDelegate>     delegate;


- (void)performEmployeeSpecificOperationWithObject:(id) object;

@end
