//
//  WYTrainingEngine.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/23.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYTrainingEngine.h"
#import "WYJsonParser.h"

@implementation WYTrainingEngine

- (void)loadLearnConfigFile:(NSString *)filePath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isFileExist = [manager fileExistsAtPath:filePath];
    if (isFileExist) {
        NSString *fileName = [manager displayNameAtPath:filePath];
        NSDictionary *fileContent = [WYJsonParser loadLocalJson:fileName];
        [self dispatchParse:fileContent];
    }
}

- (void)dispatchParse:(NSDictionary *)info
{
    
}

@end
