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
    VAPHuman *sara = [[[VAPWoman alloc] initWithName: @"Sara Connor"  age:30] autorelease];
    VAPHuman *john = [[[VAPMan alloc] initWithName:@"John Connor"  age:20] autorelease];
    VAPHuman *termik = [[[VAPMan alloc] initWithName:@"t1000"  age:43] autorelease];
    VAPHuman *bess = [[[VAPWoman alloc] initWithName:@"Бесс Мотта"  age:16] autorelease];
    
    
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
