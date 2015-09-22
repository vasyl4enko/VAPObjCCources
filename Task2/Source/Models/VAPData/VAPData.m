//
//  VAPData.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPData.h"

#import "NSString+VAPRandomString.h"

NSString * const kSlowpokeName = @"Slowpoke";

@interface VAPData ()
@property (nonatomic, strong)     NSString    *name;
@property (nonatomic, strong)     UIImage     *image;

@end

@implementation VAPData

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomString];
        self.image = [UIImage imageNamed:kSlowpokeName];
    }
    
    return self;
}

@end
