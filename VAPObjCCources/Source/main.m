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
#import "VAPCarwashBuilding.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [VAPHumanTests VAPHumanBehavourTest];
        VAPRoom *room = [[[VAPRoom alloc] init] autorelease];
        VAPBuilding *house = [[[VAPBuilding alloc] initWithBuildingType:VAPBuildingTypeCarwash] autorelease];
        [house addRoom:room];
        NSString *key = [NSString stringWithFormat:@"%@",[house class]];
        NSLog(@"%@",key);
        
        
    }
    return 0;
}
