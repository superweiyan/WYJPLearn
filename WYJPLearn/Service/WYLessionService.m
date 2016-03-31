//
//  WYLessionService.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/17.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYLessionService.h"
#import "WYModelManager.h"
#import "WYCharAudioModel.h"

@implementation WYLessionService

- (NSArray *)getAudioArrayByType:(WYAudioType)type
{
    return [[WYModelManager sharedObject].charAudioModel getAudioArrayByType:type];
}

@end
