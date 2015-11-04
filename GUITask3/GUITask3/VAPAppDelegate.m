//
//  AppDelegate.m
//  GUITask3
//
//  Created by Aleksandr Vasylchenko on 05.10.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPAppDelegate.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "VAPLoginViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "UIWindow+VAPExtensions.h"
#import "UIViewController+VAPExtensions.h"


@interface VAPAppDelegate ()

@end

@implementation VAPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    VAPLoginViewController *loginViewController = [VAPLoginViewController controller];
    
    window.rootViewController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [window makeKeyAndVisible];
   
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}




@end
