//
//  VAPCar.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAPCar : NSObject
@property(nonatomic, assign) NSUInteger money;
@property(nonatomic, assign, getter = isDirty) BOOL dirty;
@end
