//
//  VAPCar.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSUInteger const kVAPDefaultMoneyValue;

@class VAPCar;

@protocol VAPCarDelegate <NSObject>

- (void)delegatingCarShouldBecameCleaner:(VAPCar *)car;

@end

@interface VAPCar : NSObject
@property(nonatomic, assign)                    NSUInteger          wallet;
@property(nonatomic, assign, getter = isDirty)  BOOL                dirty;
@property(nonatomic, assign)                    id<VAPCarDelegate>  delegate;

- (BOOL)isPayable:(NSUInteger)money;
@end
