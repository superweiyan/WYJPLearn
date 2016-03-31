//
//  WYAudioChat.h
//  WYJPLearn
//
//  Created by weiyan on 16/3/18.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYAudioType.h"

@interface WYAudioChat : NSObject

//@property (nonatomic, assign)   MFAudioType     audoType;   // 50音图，浊音，拗音
@property (nonatomic, copy)     NSString        *HiraganaName;
@property (nonatomic, copy)     NSString        *romanName;
@property (nonatomic, copy)     NSString        *KataKanaName;  //平假名，片假名

@end
