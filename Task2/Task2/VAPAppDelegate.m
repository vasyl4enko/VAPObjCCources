//
//  VAPAppDelegate.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 17.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPAppDelegate.h"

#import "VAPRandomStringViewController.h"
#import "UIWindow+VAPExtensions.h"
#import "UIViewController+VAPExtensions.h"


@interface VAPAppDelegate ()

@end

@implementation VAPAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    VAPRandomStringViewController *randomStringViewController = [VAPRandomStringViewController controller];
    
    window.rootViewController = [[UINavigationController alloc] initWithRootViewController:randomStringViewController];
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
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
