//
//  WYModelManager.m
//  WYJPLearn
//
//  Created by weiyan on 15/12/18.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import "WYModelManager.h"
#import "WYConfigModel.h"

@implementation WYModelManager

+ (instancetype)sharedObject {
    static dispatch_once_t __once;
    static WYModelManager * __instance = nil;
    dispatch_once(&__once, ^{
        __instance = [[WYModelManager alloc] init];
    });
    return __instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    _configModel = [[WYConfigModel alloc] init];
}

@end
