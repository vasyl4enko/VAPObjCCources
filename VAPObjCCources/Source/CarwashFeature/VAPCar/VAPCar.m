//
//  VAPCar.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCar.h"

NSUInteger const kVAPDefaultMoneyValue = 235;

@implementation VAPCar

#pragma mark -
#pragma mark Initializations and Dealocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.wallet = kVAPDefaultMoneyValue;
        self.dirty = YES;
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setDirty:(BOOL)dirty {
    if (_dirty != dirty) {
        _dirty = dirty;
        if (NO == dirty) {
            self.state = VAPCarStateClean;
        }
    }
}

//- (BOOL)isObjectAbleToPay:(NSUInteger)money {
//    return self.wallet >= money;
//}
//
//- (void)payMoneyToReciver:(id<VAPMoneyFlowing>)object price:(NSUInteger)money {
//    if (self.wallet > money) {
//        object.wallet += money;
//        self.wallet -= money;
//    }
//}

@end
