//
//  AppDelegate.m
//  pintube
//
//  Created by Taeho Ko on 6/19/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "SearchViewController.h"
#import "AddViewController.h"
#import "MessageViewController.h"
#import "MeViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Create the two view controllers, each within a navigation controller
    MainViewController *mainViewController = [[MainViewController alloc] init];
    UINavigationController *mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
    SearchViewController *searchViewController = [[SearchViewController alloc] init];
    UINavigationController *searchNavigationController = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    
    AddViewController *addViewcontroller = [[AddViewController alloc] init];
    //UINavigationController *addNavigationController = [[UINavigationController alloc] initWithRootViewController:addViewcontroller];
    
    MessageViewController *messageViewcontroller = [[MessageViewController alloc] init];
    UINavigationController *messageNavigationController = [[UINavigationController alloc] initWithRootViewController:messageViewcontroller];
    
    MeViewController *meViewController = [[MeViewController alloc] init];
    UINavigationController *meNavigationController = [[UINavigationController alloc] initWithRootViewController:meViewController];
    
    
    // Configure the tab bar controller with the two navigation controllers
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[mainNavigationController, searchNavigationController, addViewcontroller, messageNavigationController, meNavigationController];
    tabBarController.tabBar.translucent = NO;
    
    mainNavigationController.tabBarItem.title = @"Main";
    mainNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_main"];
    mainNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    mainNavigationController.navigationBar.translucent = NO;
    mainNavigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    searchNavigationController.tabBarItem.title = @"Search";
    searchNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_search"];
    searchNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    searchNavigationController.navigationBar.translucent = NO;
    searchNavigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    //addNavigationController.tabBarItem.title = @"Add";
    //addNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_add"];
    //addNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    //addNavigationController.navigationBar.translucent = NO;
    //addNavigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    messageNavigationController.tabBarItem.title = @"Messages";
    messageNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_messages"];
    messageNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    messageNavigationController.navigationBar.translucent = NO;
    messageNavigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    meNavigationController.tabBarItem.title = @"Taeho";
    meNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_me"];
    meNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    meNavigationController.navigationBar.translucent = NO;
    meNavigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    //[[UITabBar appearance] setTintColor:[UIColor redColor]];
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1]];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:(242/255.0) green:(242/255.0) blue:(242/255.0) alpha:1]]; //#f2f2f2
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window.rootViewController = tabBarController;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
