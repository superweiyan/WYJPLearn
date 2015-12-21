//
//  WYModelManager.h
//  WYJPLearn
//
//  Created by weiyan on 15/12/18.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WYConfigModel;

@interface WYModelManager : NSObject

@property (nonatomic, strong) WYConfigModel *configModel;

+ (instancetype)sharedObject;

@end