//
//  WYLessionService.h
//  WYJPLearn
//
//  Created by weiyan on 16/3/17.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYAudioType.h"

@interface WYLessionService : NSObject

- (NSArray *)getAudioArrayByType:(WYAudioType)type;

@end

