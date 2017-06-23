//
//  AppDelegate.m
//  MeetBar_Project
//
//  Created by L on 2017/6/21.
//  Copyright © 2017年 MB. All rights reserved.
//

#import "AppDelegate.h"
#import "MBTabBarController.h"
#import "MBPlusButtonSubclass.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    [MBPlusButtonSubclass registerPlusButton];
    MBTabBarController *tabBarController = [[MBTabBarController alloc] init];
    [self.window setRootViewController:tabBarController];
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
