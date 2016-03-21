//
//  WYAudioPlayUtils.h
//  WYJPLearn
//
//  Created by weiyan on 16/3/21.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYAudioPlayUtils : NSObject

@property (nonatomic, strong) NSString *filePath;

- (void)startPlay;

- (void)playLocalRresouce:(NSString *)fileName;

@end
