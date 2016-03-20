//
//  WYMainViewController.m
//  WYJPLearn
//
//  Created by weiyan on 15/12/21.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import "WYMainViewController.h"
#import "MFLessionViewController.h"
#import "WYNavigationController.h"

@interface WYMainViewController()
{
    MFLessionViewController *_lessionController;
    UIViewController        *secondController;
    UIViewController        *thirdController;
    UIViewController        *fourController;
}
@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _lessionController = [[MFLessionViewController alloc] init];
    _lessionController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                                  image:[UIImage imageNamed:@"cat"] tag:0];
    WYNavigationController *firstNav = [[WYNavigationController alloc] initWithRootViewController:_lessionController];
    
    secondController = [[UIViewController alloc] init];
    secondController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"广场" image:[UIImage imageNamed:@"cow"] tag:1];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondController];
    
    thirdController = [[UIViewController alloc] init];
    thirdController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"dog"] tag:2];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:thirdController];
    
    fourController = [[UIViewController alloc] init];
    fourController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"duck"] tag:3];
    UINavigationController *fourNav = [[UINavigationController alloc] initWithRootViewController:fourController];
    
    self.viewControllers = @[firstNav, secondNav, thirdNav, fourNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
