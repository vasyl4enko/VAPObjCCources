//
//  VAPDirector.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDirector.h"


static NSString *const kDirectorGreeting  = @"I'm director";
NSString *const kDirectorProffit = @"My proffit %lu";

@implementation VAPDirector


#pragma mark -
#pragma mark VAPAccountantDelegate

- (void)employeeDidEndJob:(VAPEmployee *)employee {
    [employee moneyTransferTo:self withCost:employee.wallet];
    NSLog(@"I have %lu",self.wallet);
}


@end
