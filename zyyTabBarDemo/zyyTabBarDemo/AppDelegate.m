//
//  AppDelegate.m
//  zyyTabBarDemo
//
//  Created by 郑玉洋 on 2017/4/20.
//  Copyright © 2017年 郑玉洋. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "PublishViewController.h"
#import "SamecityViewController.h"

#import "ZYYTabBar.h"

@interface AppDelegate ()<TabBarDelegate, UIActionSheetDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    MessageViewController *messageViewController = [[MessageViewController alloc] init];
    MineViewController *mineViewController = [[MineViewController alloc] init];
    PublishViewController *publishViewController = [[PublishViewController alloc] init];
    SamecityViewController *samecityViewController = [[SamecityViewController alloc] init];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[homeViewController, messageViewController, mineViewController, publishViewController, samecityViewController];
    
    ZYYTabBar *tabBar = [[ZYYTabBar alloc] initWithFrame:tabBarController.tabBar.bounds];
    tabBar.tabBarItemAttributes = @[@{kTabBarItemAttributeTitle : @"首页", kTabBarItemAttributeNormalImageName : @"home_normal", kTabBarItemAttributeSelectedImageName : @"home_highlight", kTabBarItemAttributeType : @(TabBarItemNormal)},
                                    @{kTabBarItemAttributeTitle : @"同城", kTabBarItemAttributeNormalImageName : @"mycity_normal", kTabBarItemAttributeSelectedImageName : @"mycity_highlight", kTabBarItemAttributeType : @(TabBarItemNormal)},
                                    @{kTabBarItemAttributeTitle : @"发布", kTabBarItemAttributeNormalImageName : @"post_normal", kTabBarItemAttributeSelectedImageName : @"post_normal", kTabBarItemAttributeType : @(TabBarItemRise)},
                                    @{kTabBarItemAttributeTitle : @"消息", kTabBarItemAttributeNormalImageName : @"message_normal", kTabBarItemAttributeSelectedImageName : @"message_highlight", kTabBarItemAttributeType : @(TabBarItemNormal)},
                                    @{kTabBarItemAttributeTitle : @"我的", kTabBarItemAttributeNormalImageName : @"account_normal", kTabBarItemAttributeSelectedImageName : @"account_highlight", kTabBarItemAttributeType : @(TabBarItemNormal)}];
    tabBar.delegate = self;
    
    [tabBarController.tabBar addSubview:tabBar];
    
    self.window.rootViewController = tabBarController;
    return YES;
}

- (void)tabBarDidSelectedRiseButton{
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UIViewController *viewController = tabBarController.selectedViewController;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册选取", @"淘宝一键转卖", nil];
    [actionSheet showInView:viewController.view];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
