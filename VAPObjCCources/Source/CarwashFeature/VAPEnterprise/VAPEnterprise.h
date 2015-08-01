//
//  VAPEnterprise.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 15.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>


@class VAPEmployee;

@class VAPCar;

FOUNDATION_EXTERN NSString *const kErrorMessage;
FOUNDATION_EXTERN NSString *const kCarDirty;
FOUNDATION_EXTERN NSString *const kWorkerBusy;

@interface VAPEnterprise : NSObject
@property (nonatomic, retain, readonly) NSArray *employees;





- (void)addEmmployye:(VAPEmployee *)object;
- (void)washCar:(VAPCar *)object;




@end
