//
//  WYLogManager.h
//  WYJPLearn
//
//  Created by weiyan on 16/3/30.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LOG_LEVEL_DEF DDLogLevelInfo
#import <CocoaLumberjack/CocoaLumberjack.h>

extern NSString *WYExamLog;

@interface WYLogManager : NSObject

+ (void)info:(NSString *)key log:(NSString *)log;
+ (void)error:(NSString *)key log:(NSString *)log;

+ (void)initLogInfo;

@end
