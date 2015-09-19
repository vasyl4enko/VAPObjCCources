//
//  UIWindow+VAPExtensions.m
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 15.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "UIWindow+VAPExtensions.h"

@implementation UIWindow (VAPExtensions)

+ (id)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
