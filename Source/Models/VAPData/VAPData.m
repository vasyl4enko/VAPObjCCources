//
//  VAPData.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPData.h"

#import "NSString+VAPRandomString.h"

#import "VAPMacros.h"

static NSString * const kSlowpokeName = @"Slowpoke";
static NSString * const kPNGExtension = @"png";
static NSString * const kNameDataKey =  @"name";
static NSString * const kUrlDataKey =   @"url";

@interface VAPData ()
@property (nonatomic, strong)       NSString    *name;
@property (nonatomic, strong)       NSURL       *url;
@property (nonatomic, readwrite)    UIImage     *image;

@end

@implementation VAPData

//@dynamic image;

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
#pragma mark Public Methods

- (void)performLoading {
    [NSThread sleepForTimeInterval:2];
//    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.url]];
    self.image = [UIImage imageNamed:@"Slowpoke"];
}

#pragma mark -
#pragma mark NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:kNameDataKey];
        self.url = [coder decodeObjectForKey:kUrlDataKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:kNameDataKey];
    [coder encodeObject:self.url forKey:kUrlDataKey];
}

@end
