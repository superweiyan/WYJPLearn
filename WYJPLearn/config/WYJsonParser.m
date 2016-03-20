//
//  WYJsonParser.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/17.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYJsonParser.h"

@implementation WYJsonParser

+ (NSDictionary *)loadLocalJson:(NSString *)fileName
{
    NSError *error = nil;
    NSString *path = [[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/"] stringByAppendingString:fileName];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (json == nil) {
        NSLog(@"json parse failed");
        return nil;
    }
    return json;
}

@end
