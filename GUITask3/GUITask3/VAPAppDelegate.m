//
//  AppDelegate.m
//  GUITask3
//
//  Created by Aleksandr Vasylchenko on 05.10.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPAppDelegate.h"

#import "VAPRandomStringViewController.h"

#import "UIWindow+VAPExtensions.h"
#import "UIViewController+VAPExtensions.h"
#import "NSFileManager+VAPExtensions.h"

static NSString * const kVAPArchiveFileName = @"data.plist";

@interface VAPAppDelegate ()
@property (nonatomic, readonly) NSString *path;
@property (nonatomic, strong) VAPDataArray *dataArray;

@end

@implementation VAPAppDelegate
@dynamic path;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    VAPRandomStringViewController *randomStringViewController = [VAPRandomStringViewController controller];
    self.dataArray = [VAPDataArray new];
    randomStringViewController.dataArray = self.dataArray;
    window.rootViewController = [[UINavigationController alloc] initWithRootViewController:randomStringViewController];
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [NSKeyedArchiver archiveRootObject:self.dataArray toFile:self.path];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

#pragma mark -
#pragma mark Accessors 

- (NSString *)path {
    return [NSFileManager pathWithFileName:kVAPArchiveFileName];
}

- (void)setDataArray:(VAPDataArray *)dataArray {
    VAPDataArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    if (!array) {
        array = dataArray;
    }
    
    _dataArray = array;
}

@end
