//
//  VAPImage.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPImage.h"

@implementation VAPImage

#pragma mark -
#pragma mark Class methods

+ (UIImage *)loadImageWithURL:(NSURL *)url {
    NSData *data = [NSData dataWithContentsOfURL:url];
   
    return [UIImage imageWithData:data];
}

@end
