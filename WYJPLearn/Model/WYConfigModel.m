//
//  WYConfigModel.m
//  WYJPLearn
//
//  Created by weiyan on 15/12/18.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import "WYConfigModel.h"
#import "WYConfigCore.h"

@interface WYConfigModel()
{
    WYConfigCore *_configCore;
}
@end

@implementation WYConfigModel

- (id)init
{
    self = [super init];
    if (self) {
        _configCore = [[WYConfigCore alloc] init];
    }
    return self;
}

- (void)loadConfig
{
    [_configCore querySoundMarkConfig];
}

@end
