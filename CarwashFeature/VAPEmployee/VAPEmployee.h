//
//  VAPEmployee.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAPEmployee : NSObject

typedef NS_ENUM(NSUInteger, VAPEmployeeType) {
    VAPAccountantType,
    VAPCarwasherType,
    VAPDirectorType
};

- (id)initWithEmployeeType:(VAPEmployeeType) type;

- (void)performEmployeeSpecificOperation;

@end
