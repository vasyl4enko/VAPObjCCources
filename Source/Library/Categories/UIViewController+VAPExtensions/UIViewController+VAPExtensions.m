//
//  UIViewController+VAPExtensions.m
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 16.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "UIViewController+VAPExtensions.h"

@implementation UIViewController (VAPExtensions)

+ (id)controller {
    return [[self alloc] initWithNibName:[self nibName] bundle:nil];
}

+ (id)nibName {
    return nil;
}

@end
