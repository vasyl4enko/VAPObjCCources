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

@interface VAPAppDelegate ()
@property (nonatomic, strong) VAPDataArray *dataArray;

@end

@implementation VAPAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    VAPRandomStringViewController *randomStringViewController = [VAPRandomStringViewController controller];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths firstObject] stringByAppendingPathComponent:@"data.plist"];
    VAPDataArray *dataArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!dataArray) {
        dataArray = [VAPDataArray new];
    }
    
    self.dataArray = dataArray;
    randomStringViewController.dataArray = dataArray;
    window.rootViewController = [[UINavigationController alloc] initWithRootViewController:randomStringViewController];
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths firstObject] stringByAppendingPathComponent:@"data.plist"];
    [NSKeyedArchiver archiveRootObject:self.dataArray toFile:path];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
