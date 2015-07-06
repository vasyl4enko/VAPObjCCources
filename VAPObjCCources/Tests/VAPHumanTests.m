//
//  VAPHumanTests.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 06.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPHumanTests.h"
#import "VAPHuman.h"

@implementation VAPHumanTests

- (void)VAPHumanBehavourTest {
    @autoreleasepool {
        VAPHuman *sara = [[[VAPHuman alloc] initWithName:@"Sara Connor" gender:VAPHumanGenderFemale age:30] autorelease];
        VAPHuman *john = [[[VAPHuman alloc] initWithName:@"John Connor" gender:VAPHumanGenderMale age:20] autorelease];
        VAPHuman *termik = [[[VAPHuman alloc] initWithName:@"t1000" gender:VAPHumanGenderMale age:43] autorelease];
        
        
        uint64_t iterator;
        while (iterator < 5) {
            [sara VAPHumanAddChild:[sara VAPHumanBirthChild]];
            iterator++;
        }
        
        
        iterator = 0;
        while (iterator < 5) {
            [john VAPHumanAddChild:[sara VAPHumanBirthChild]];
            iterator++;
        }
        
        iterator = 0;
        while (iterator < 5) {
            
            [termik VAPHumanAddChild:[sara VAPHumanBirthChild]];
            iterator++;
        }
        
        
        NSArray *array = [@[sara, john, termik] autorelease];
        NSMutableArray *childrenArray = [[[NSMutableArray alloc] init] autorelease];
        for (VAPHuman *human in array) {
            
            [childrenArray addObject: [human VAPHumanActionByGender]];
            [human VAPHumanActionByGender];
            [human VAPHumanSayHello];

        }
        NSLog(@"%lu",(unsigned long)[childrenArray count]);
        
    }
}

@end
