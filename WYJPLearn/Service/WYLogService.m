//
//  WYLogManager.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/30.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYLogService.h"

NSString *WYExamLog = @"WYExamLog";

@interface WYLogService()
{
    DDFileLogger *_fileLog;
}
@end

@implementation WYLogService

- (id)init
{
    self = [super init];
    if (self) {
        [self initLogInfo];
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

- (void)initLogInfo
{
    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelInfo];
    _fileLog = [[DDFileLogger alloc] init];
    _fileLog.maximumFileSize = 5 * 1024 * 1024;
    [DDLog addLogger:_fileLog];
}

- (NSString *)getLog
{
    DDLogFileInfo *fileInfo = [_fileLog currentLogFileInfo];
    return  fileInfo.filePath;
}
@end
