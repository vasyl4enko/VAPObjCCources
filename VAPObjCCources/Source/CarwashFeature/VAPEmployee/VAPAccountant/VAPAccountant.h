//
//  VAPAccountant.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployee.h"

#import "VAPCarwasher.h"

FOUNDATION_EXTERN NSUInteger const kDefualtSendingToDirector;

@class VAPAccountant;

@protocol VAPAccountantDelegate <NSObject>

- (void)delegatingAccountantDidAddMoney:(VAPAccountant *)accountant;

@end

@interface VAPAccountant : VAPEmployee<VAPMoneyFlowingDelegate>
@property(nonatomic, retain)    VAPCarwasher                    *delegatingObject;
//@property(nonatomic, assign)    id<VAPAccountantDelegate>       delegate;
@end
