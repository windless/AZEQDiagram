//
//  AZAppDelegate.m
//  AZEQDiagram
//
//  Created by CocoaPods on 11/13/2014.
//  Copyright (c) 2014 Abner Zhong. All rights reserved.
//

#import "AZAppDelegate.h"
#import "AZViewController.h"

@implementation AZAppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.rootViewController = [[AZViewController alloc] init];
  [self.window makeKeyAndVisible];
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
