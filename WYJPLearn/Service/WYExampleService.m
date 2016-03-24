//
//  WYExampleService.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/24.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYExampleService.h"
#import "WYTrainingEngine.h"

@interface WYExampleService()
{
    WYTrainingEngine *_traningEngine;
}
@end

@implementation WYExampleService

- (id)init
{
    self = [super init];
    if(self) {
        _traningEngine = [[WYTrainingEngine alloc] init];
    }
    return self;
}

- (WYTraningQuestion *)generateQuestion:(WYTraningParserType *)parseType
                            paramOption:(NSUInteger)option
{
    return [_traningEngine generateQuestion:parseType paramOption:option];
}
@end
