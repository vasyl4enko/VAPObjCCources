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
    VAPHuman *sara = [[[VAPWoman alloc] initWithName:@"Sara Connor" gender:VAPHumanGenderFemale age:30] autorelease];
    VAPHuman *john = [[[VAPMan alloc] initWithName:@"John Connor" gender:VAPHumanGenderMale age:20] autorelease];
    VAPHuman *termik = [[[VAPMan alloc] initWithName:@"t1000" gender:VAPHumanGenderMale age:43] autorelease];
    VAPHuman *bess = [[[VAPWoman alloc] initWithName:@"Бесс Мотта" gender:VAPHumanGenderFemale age:16] autorelease];
    
    [sara addChild:john];
    [john addChild:termik];
    [sara sayHello];
    
    NSArray *array = @[sara, john, termik, bess];
    for (VAPHuman *human in array) {
        [human performGenderSpecificOperation];
    }
    
    
}

@end
