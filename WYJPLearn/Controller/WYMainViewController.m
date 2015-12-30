//
//  WYMainViewController.m
//  WYJPLearn
//
//  Created by weiyan on 15/12/21.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import "WYMainViewController.h"
#import "MFLessionViewController.h"

@interface WYMainViewController()
{
    MFLessionViewController *_lessionController;
    UIViewController        *secondController;
    UIViewController *thirdController;
    UIViewController *fourController;
}
@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    _lessionController = [[MFLessionViewController alloc] init];
    _lessionController.title = @"1";
    _lessionController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil tag:0];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:_lessionController];
    
    secondController = [[UIViewController alloc] init];
    secondController.view.backgroundColor = [UIColor blueColor];
    secondController.title = @"2";
    
    secondController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"广场" image:nil tag:1];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondController];
    
    thirdController = [[UIViewController alloc] init];
    thirdController.view.backgroundColor = [UIColor grayColor];
    thirdController.title = @"3";
    thirdController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:nil tag:2];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:thirdController];
    
    fourController = [[UIViewController alloc] init];
    fourController.view.backgroundColor = [UIColor yellowColor];
    fourController.title = @"4";
    fourController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:nil tag:3];
    UINavigationController *fourNav = [[UINavigationController alloc] initWithRootViewController:fourController];
    self.viewControllers = @[firstNav, secondNav, thirdNav, fourNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end