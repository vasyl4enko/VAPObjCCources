//
//  VAPCar.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCar.h"

static CGFloat const kVAPDefaultMoneyValue = 235.4;

@implementation VAPCar

- (instancetype)init {
    self = [super init];
    if (self) {
        self.money = kVAPDefaultMoneyValue;
    }
    return self;
}

@end
