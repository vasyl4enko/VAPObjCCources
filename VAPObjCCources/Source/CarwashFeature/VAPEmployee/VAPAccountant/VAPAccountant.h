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

@interface VAPAccountant : VAPEmployee<VAPMoneyFlowingDelegate>

@property(nonatomic, retain)    VAPCarwasher    *delegatingObject;

@end
