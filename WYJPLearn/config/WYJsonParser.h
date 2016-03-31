//
//  WYJsonParser.h
//  WYJPLearn
//
//  Created by weiyan on 16/3/17.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYJsonParser : NSObject

+ (NSDictionary *)loadLocalJson:(NSString *)fileName;

@end
