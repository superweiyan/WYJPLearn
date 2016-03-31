//
//  WYTrainingEngine.h
//  WYJPLearn
//
//  Created by weiyan on 16/3/23.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYTraniningEnum.h"

@class WYTraningQuestion;

@interface WYTrainingEngine : NSObject

- (void)loadLearnConfigFile:(NSString *)filePath;

- (WYTraningQuestion *)generateQuestion:(WYTraningParserType *)parseType
                            paramOption:(NSUInteger)option;

@end
