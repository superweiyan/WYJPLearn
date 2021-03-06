//
//  WYConfigService.m
//  WYJPLearn
//
//  Created by weiyan on 15/12/18.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import "WYConfigService.h"
#import "WYModelManager.h"
#import "WYConfigModel.h"

@implementation WYConfigService

+ (instancetype)sharedObject
{
    static dispatch_once_t __once;
    static WYConfigService * __instance = nil;
    dispatch_once(&__once, ^{
        __instance = [[WYConfigService alloc] init];
    });
    return __instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self loadConfig];
    }
    return self;
}

- (void)loadConfig
{
    [[WYModelManager sharedObject].configModel loadConfig];
}

@end
