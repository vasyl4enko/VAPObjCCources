//
//  NSIndexPath+VAPExtensions.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 25.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "NSIndexPath+VAPExtensions.h"

static const NSUInteger kVAPMagicNumber = 0;

@implementation NSIndexPath (VAPExtensions)

+ (id)indexPathForRow:(NSUInteger)index {
   return [self indexPathForRow:index inSection:kVAPMagicNumber];
}

@end
