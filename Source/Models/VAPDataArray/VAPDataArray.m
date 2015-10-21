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
#pragma mark Public Methods

- (void)save {
    NSString *path = [NSFileManager pathWithFileName:kVAPArchiveFileName];
    [[NSKeyedArchiver archivedDataWithRootObject:self.data] writeToFile:path atomically:YES];
}

- (void)performLoading {
    
    id array = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSFileManager pathWithFileName:kVAPArchiveFileName]];
    if (!array) {
        [self fillDataArray];
    } else {
        [NSThread sleepForTimeInterval:2];
        [self performBlock:^{
            for (VAPData *object in array) {
                [self addObject:object];
            }
        } shouldNotify:NO];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)fillDataArray {
    [self performBlock:^{
        for (NSUInteger index = 0; index < kVAPCountRows; index++) {
            [self addObject:[VAPData new]];
        }
    } shouldNotify:NO];
    
    self.state = VAPLoadingStatesDidLoad;
}

@end
