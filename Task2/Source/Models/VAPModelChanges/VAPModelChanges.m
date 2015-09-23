//
//  VAPModelChanges.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 23.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPModelChanges.h"

@implementation VAPModelChanges

+ (id)setupModelWithFromVar:(NSUInteger)fromVar toVar:(NSUInteger)toVar {
    VAPModelChanges *model  = [VAPModelChanges new];
    model.fromVar = fromVar;
    model.toVar = toVar;
    
    return model;
}

@end
