//
//  VAPData.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPData.h"

#import "NSString+VAPRandomString.h"
#import "VAPDispatch.h"

#import "VAPMacros.h"
#import "VAPImageModel.h"

static NSString * const kSlowpokeName = @"Slowpoke";
static NSString * const kPNGExtension = @"png";
static NSString * const kNameDataKey =  @"name";
static NSString * const kUrlDataKey =   @"url";
static NSString * const kUrl =          @"http://multidoge.org/images/MultiDoge.png";

@interface VAPData ()
@property (nonatomic, strong)   NSString            *name;
@property (nonatomic, strong)   VAPImageModel       *image;

@end

@implementation VAPData

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomString];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (VAPImageModel *)image {
    NSURL *url = [NSURL URLWithString:kUrl];
    
    return [VAPImageModel imageModelWithUrl:url];
}

#pragma mark -
#pragma mark NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:kNameDataKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:kNameDataKey];
}

@end
