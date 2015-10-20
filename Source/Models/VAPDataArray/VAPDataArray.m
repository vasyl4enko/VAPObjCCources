//
//  VAPDataArray.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDataArray.h"

#import "VAPData.h"

#import "NSFileManager+VAPExtensions.h"

static NSUInteger const kVAPCountRows = 10;
static NSString * const kVAPArchiveFileName = @"data.plist";
static NSString * const kVAPMutableDataKey  = @"mutableData";

@interface VAPDataArray ()

- (void)fillDataArray;

@end

@implementation VAPDataArray

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCount:(NSUInteger)count {
    self = [super init];
    if (self) {
        [self fillDataArray];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)save {
    [[NSKeyedArchiver archivedDataWithRootObject:self.data] writeToFile:[NSFileManager pathWithFileName:kVAPArchiveFileName] atomically:YES];
}

- (void)performLoading {
    sleep(2);
    
    id array = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSFileManager pathWithFileName:kVAPArchiveFileName]];
    if (array) {
        for (id object in array) {
            [self performBlock:^{
                [self addObject:object];
            } shouldNotify:NO];
        }
    } else {
        [self performBlock:^{
            [self fillDataArray];
        } shouldNotify:NO];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)fillDataArray {
    for (NSUInteger index = 0; index < kVAPCountRows; index++) {
        [self addObject:[VAPData new]];
    }
}

@end
