//
//  main.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 06.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+VAPRandomString.h"

#import "VAPHumanTests.h"
#import "VAPCarwashRoom.h"
#import "VAPCarwashBuilding.h"
#import "VAPCar.h"
#import "VAPEmployee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [VAPHumanTests VAPHumanBehavourTest];

//        NSRange range = NSMakeRange('A', 'Z' - 'A');
        
//        unichar cha = range.location;
        
        NSString *str = [NSString randomString];
        
        
        
        
    }
    return 0;
}
