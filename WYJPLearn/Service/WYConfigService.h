//
//  WYConfigService.h
//  WYJPLearn
//
//  Created by weiyan on 15/12/18.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYConfigService : NSObject

+ (instancetype)sharedObject;

- (void)loadConfig;

@end
