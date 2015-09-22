//
//  VAPData.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPData.h"

#import "NSString+VAPRandomString.h"
#import "VAPImage.h"

NSString * const kSlowpokeName = @"Slowpoke";
NSString * const kPNGExtension = @"png";


@interface VAPData ()
@property (nonatomic, strong)     NSString    *name;
@property (nonatomic, strong)     NSURL       *url;
@property (nonatomic, strong)     UIImage     *image;

@end

@implementation VAPData

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
    if (!_image) {
        _image = [VAPImage loadImageWithURL:self.url];
    }
    
    return _image;
}

@end
