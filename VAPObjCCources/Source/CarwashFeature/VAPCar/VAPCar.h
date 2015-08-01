//
//  VAPCar.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPObservableObject.h"

FOUNDATION_EXTERN NSUInteger const kVAPDefaultMoneyValue;

@class VAPCar;

typedef NS_ENUM(NSUInteger, VAPCarState) {
    VAPCarStateClean
};

@protocol VAPCarObserver <NSObject>

- (void)carDidBecomeCleaner:(VAPCar *)car;

@end

@interface VAPCar : VAPObservableObject
@property(nonatomic, assign)                    NSUInteger wallet;
@property(nonatomic, assign, getter = isDirty)  BOOL dirty;
@end
