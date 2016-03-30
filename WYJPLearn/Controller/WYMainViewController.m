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
#import "WYAudioExampleViewController.h"
#import "WYSettingTableViewController.h"

@interface WYMainViewController()
{
    MFLessionViewController             *_lessionController;
    UIViewController                    *secondController;
    WYAudioExampleViewController        *_thirdController;
    WYSettingTableViewController        *_settingController;
}
@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _lessionController = [[MFLessionViewController alloc] init];
    _lessionController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                                  image:[UIImage imageNamed:@"cat"]
                                                                    tag:0];
    WYNavigationController *firstNav = [[WYNavigationController alloc] initWithRootViewController:_lessionController];
    
    secondController = [[UIViewController alloc] init];
    secondController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"广场"
                                                                image:[UIImage imageNamed:@"cow"]
                                                                  tag:1];
    UINavigationController *secondNav = [[UINavigationController alloc]
                                         initWithRootViewController:secondController];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"WYExample" bundle:[NSBundle mainBundle]];
    _thirdController =  [storyBoard instantiateViewControllerWithIdentifier:@"WYAudioExampleViewController"];
    _thirdController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"考试" image:[UIImage imageNamed:@"dog"] tag:2];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:_thirdController];
    
    UIStoryboard *settingStoryBoard = [UIStoryboard storyboardWithName:@"WYSetting" bundle:[NSBundle mainBundle]];
    _settingController = [settingStoryBoard instantiateViewControllerWithIdentifier:@"WYSettingTableViewController"];
    _settingController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我"
                                                                  image:[UIImage imageNamed:@"duck"]
                                                                    tag:3];
    UINavigationController *fourNav = [[UINavigationController alloc]
                                       initWithRootViewController:_settingController];
    
    self.viewControllers = @[firstNav, secondNav, thirdNav, fourNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
