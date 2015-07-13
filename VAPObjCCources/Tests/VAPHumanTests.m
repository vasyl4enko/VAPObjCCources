//
//  VAPHumanTests.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 06.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPHumanTests.h"
#import "VAPHuman.h"
#import "VAPMan.h"
#import "VAPWoman.h"

@implementation VAPHumanTests

+ (void)VAPHumanBehavourTest {
    VAPHuman *sara = [[VAPWoman alloc] init];
    VAPHuman *john = [[VAPMan alloc] init];
    VAPHuman *termik = [[VAPMan alloc] init];
    VAPHuman *bess = [[VAPWoman alloc] init];

    sara.name = @"Sara Connor";
    john.name = @"John Connor";
    termik.name = @"t1000";
    
    [sara addChild:john];
    [john addChild:termik];
    [sara sayHello];
    
    NSArray *array = @[sara, john, termik, bess];
    for (VAPHuman *human in array) {
      [human performGenderSpecificOperation];
    }
    
    uint64_t index = 0;
    
    while (index < 10) {
        id obj = [sara performGenderSpecificOperation];
        NSLog(@"%@",[obj class]);
        index++;
    }
}

@end
