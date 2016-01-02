//
//  AppDelegate.m
//  myPush
//
//  Created by mac on 16/1/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "JCNav.h"
#import "JCOne.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    JCOne *one = [[JCOne alloc] init];
    one.title = @"one";
    JCNav *nav = [[JCNav alloc] initWithRootViewController:one];
    
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

@end
