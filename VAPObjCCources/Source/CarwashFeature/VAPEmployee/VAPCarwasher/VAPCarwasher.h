//
//  VAPCarwasher.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployee.h"
#import "VAPCar.h"

FOUNDATION_EXTERN NSString *const kCarwasherGreeting;
FOUNDATION_EXTERN NSUInteger const kDefualtCost;
FOUNDATION_EXTERN NSString *const kCarWasWashed;

@class VAPCarwasher;

@protocol VAPCarwasherDelegate <NSObject>

- (void)delegatingCarwasherDidAddMoney:(VAPCarwasher *)carwasher;

@end

@interface VAPCarwasher : VAPEmployee<VAPCarDelegate>
@property(nonatomic, retain)    VAPCar                      *delegatingObject;
@end
