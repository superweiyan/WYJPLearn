//
//  WYInterfaceService.m
//  WYJPLearn
//
//  Created by weiyan on 15/12/23.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import "WYInterfaceService.h"
#import "WYPhonematicChartViewController.h"
#import "WYMainViewController.h"
#import "AppDelegate.h"

@interface WYInterfaceService()<UITabBarControllerDelegate>
{
    WYMainViewController *_mainViewController;
}

@end

@implementation WYInterfaceService

+ (instancetype)sharedObject
{
    static dispatch_once_t __once;
    static WYInterfaceService * __instance = nil;
    dispatch_once(&__once, ^{
        __instance = [[WYInterfaceService alloc] init];
    });
    return __instance;
}

- (void)showMainViewController
{
    _mainViewController = [[WYMainViewController alloc] init];
    _mainViewController.delegate = self;
    
    AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
    
    appDelegate.window.rootViewController = _mainViewController;
    [appDelegate.window makeKeyAndVisible];
    _navigationController = _mainViewController.selectedViewController;
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        if (_navigationController != viewController) {
            _navigationController = (UINavigationController *)viewController;
        }
        return YES;
    }
    return NO;
}

- (void)jumpToWYPhonematicChartViewController
{
//    WYPhonematicChartViewController *chartViewController =[[WYPhonematicChartViewController alloc] init];
    
}
@end
