//
//  VAPEnterprise.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 15.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VAPBuilding;
@class VAPEmployee;
@class VAPRoom;
@class VAPCar;

@interface VAPEnterprise : NSObject
@property (nonatomic, retain, readonly) NSArray *employees;
@property (nonatomic, retain, readonly) NSArray *buildings;


- (void)addBuilding:(VAPEmployee *)object;
- (void)addRoom:(VAPRoom *)object;
- (void)addEmmployye:(VAPEmployee *)object;
- (void)washCar:(VAPCar *)object; // none




@end
