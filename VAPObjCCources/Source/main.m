//
//  main.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 06.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VAPHumanTests.h"
#import "VAPCarwashRoom.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [VAPHumanTests VAPHumanBehavourTest];
        VAPRoom *room = [[VAPRoom alloc] init];
        NSString *str = @"dsf";
        [room addEmployee:str];
        [room removeEmployee:str];
        
        
    }
    return 0;
}
