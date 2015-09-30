//
//  VAPData.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPData.h"

#import "NSString+VAPRandomString.h"

static NSString * const kSlowpokeName = @"Slowpoke";
static NSString * const kPNGExtension = @"png";

@interface VAPData ()
@property (nonatomic, strong)     NSString    *name;
@property (nonatomic, strong)     NSURL       *url;

@end

@implementation VAPData

@dynamic image;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomString];
        self.url = [[NSBundle mainBundle] URLForResource:kSlowpokeName withExtension:kPNGExtension];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (UIImage *)image {
    static UIImage *__slowpokeImage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
            NSData *fileFromUrl = [NSData dataWithContentsOfURL:self.url];
            __slowpokeImage = [UIImage imageWithData:fileFromUrl];
    });

    return __slowpokeImage;
}


@end
