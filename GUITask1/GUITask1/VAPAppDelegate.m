//
//  VAPAppDelegate.m
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 08.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPAppDelegate.h"

#import "VAPSquareHolderViewController.h"
#import "UIWindow+VAPExtensions.h"

@interface VAPAppDelegate ()

@end

@implementation VAPAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    window.rootViewController = [[VAPSquareHolderViewController alloc] initWithNibName:nil bundle:nil];
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
