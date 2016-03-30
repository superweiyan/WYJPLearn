//
//  WYLogManager.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/30.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYLogManager.h"

NSString *WYExamLog = @"WYExamLog";

@implementation WYLogManager

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

+ (void)info:(NSString *)key log:(NSString *)log
{
    DDLogInfo(@"[%@] %@", key, log);
}

+ (void)error:(NSString *)key log:(NSString *)log
{
    DDLogError(@"[%@] %@", key, log);
}

+ (void)initLogInfo
{
    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelInfo];
    DDFileLogger *fileLog = [[DDFileLogger alloc] init];
    fileLog.maximumFileSize = 5 * 1024 * 1024;
    [DDLog addLogger:fileLog];
}
@end
