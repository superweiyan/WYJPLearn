//
//  WYInterfaceService.h
//  WYJPLearn
//
//  Created by weiyan on 15/12/23.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WYInterfaceService : NSObject

@property (nonatomic, readonly) UINavigationController *navigationController;

+ (instancetype)sharedObject;

- (void)showMainViewController;

//- (void)jumpToWYPhonematicChartViewController;

@end
