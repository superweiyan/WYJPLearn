//
//  WYExampleService.h
//  WYJPLearn
//
//  Created by weiyan on 16/3/24.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYTraniningEnum.h"

@class WYTraningQuestion;


@interface WYExampleService : NSObject

- (WYTraningQuestion *)generateQuestion:(WYTraningParserType *)parseType
                            paramOption:(NSUInteger)option;

@end
