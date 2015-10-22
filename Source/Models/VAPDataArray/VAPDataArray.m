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
@property (nonatomic, readonly) NSArray     *notificationsNames;
@property (nonatomic, readonly) NSString    *fileName;
@property (nonatomic, readonly) NSString    *filePath;

- (void)fillDataArray;
- (void)serializeArrayWithObject:(id)object;

- (void)subscribeNotifications:(NSArray *)notifications;
- (void)unsubscribeNotifications:(NSArray *)notifications;

@end

@implementation VAPDataArray

@dynamic notificationsNames;
@dynamic fileName;
@dynamic filePath;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self unsubscribeNotifications:self.notificationsNames];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self subscribeNotifications:self.notificationsNames];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)notificationsNames {
    return @[UIApplicationWillTerminateNotification,UIApplicationWillResignActiveNotification];
}

- (NSString *)filePath {
    return [NSFileManager pathWithFileName:self.fileName];
}

- (NSString *)fileName {
    return kVAPArchiveFileName;
}

#pragma mark -
#pragma mark Public Methods

- (void)performLoading {
    
    id array = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    if (!array) {
        [self fillDataArray];
    } else {
        [NSThread sleepForTimeInterval:2];
        [self performBlock:^{
            for (VAPData *object in array) {
                [self addObject:object];
            }
        } shouldNotify:NO];
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            self.state = VAPLoadingStatesDidLoad;
        });
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
    

    dispatch_async(dispatch_get_main_queue(), ^(void){
        self.state = VAPLoadingStatesDidLoad;
    });
}

- (void)serializeArrayWithObject:(id)object {
    NSString *path = [NSFileManager pathWithFileName:self.fileName];
    [[NSKeyedArchiver archivedDataWithRootObject:self.data] writeToFile:path atomically:YES];
}

- (void)subscribeNotifications:(NSArray *)notifications {
    for (id object in notifications) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(serializeArrayWithObject:)
                                                     name:object object:nil];
    }
    
}

- (void)unsubscribeNotifications:(NSArray *)notifications {
    for (id object in notifications) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:object object:nil];
    }
}

@end
