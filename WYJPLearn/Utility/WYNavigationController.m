//
//  WYNavigationController.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/16.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYNavigationController.h"

@interface WYNavigationController ()

@end

@implementation WYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray *controllers = self.viewControllers;
    if (controllers.count == 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
    
//    NSArray *controllers1 = self.viewControllers;
//    if (controllers1.count == 1) {
//        viewController.hidesBottomBarWhenPushed = NO;
//    }
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *popViewController = [super popViewControllerAnimated:animated];
//    NSArray *controllers = self.viewControllers;
//    if (controllers.count == 1) {
//        UIViewController *controller = [controllers objectAtIndex:0];
//        controller.hidesBottomBarWhenPushed = NO;
//    }
    return popViewController;
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
