//
//  VAPCar.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VAPMoneyFlowing.h"


FOUNDATION_EXTERN NSUInteger const kVAPDefaultMoneyValue;

@class VAPCar;

@interface VAPCar : NSObject<VAPMoneyFlowing>
@property(nonatomic, assign)                        NSUInteger          wallet;
@property(nonatomic, assign, getter = isDirty)      BOOL                dirty;


@end
