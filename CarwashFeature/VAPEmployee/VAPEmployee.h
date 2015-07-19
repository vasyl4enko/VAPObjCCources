//
//  VAPEmployee.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VAPEmployeeType) {
    VAPAccountantType,
    VAPCarwasherType,
    VAPDirectorType
};

@interface VAPEmployee : NSObject
@property(nonatomic, copy)      NSDate      *experience;
@property(nonatomic, assign)    CGFloat     salary;

- (id)initWithEmployeeType:(VAPEmployeeType) type;

- (id)performEmployeeSpecificOperationWithObject:(id) object;

@end
