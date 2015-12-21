//
//  WYConfigCore.m
//  WYJPLearn
//
//  Created by weiyan on 15/12/18.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import "WYConfigCore.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "WYConfigHeader.h"
#import "WYJsonToModel.h"
#import "WYConfig.h"
#import "MFTestModel.h"

@interface WYConfigCore()
{
    AFHTTPRequestOperationManager *_httpManager;
}
@end

@implementation WYConfigCore

- (id)init
{
    self = [super init];
    if (self) {
        _httpManager = [AFHTTPRequestOperationManager manager];
        
        [self testJson:@"MFTestModel"];
    }
    return self;

}

- (void)querySoundMarkConfig
{
    NSString *url = [NSString stringWithFormat:@"%@/WYSoundmark.json", WYConfigUrl];
    [_httpManager GET:url
           parameters:nil
              success:^(AFHTTPRequestOperation * operation, id responseObject) {
                  NSString *responseString = operation.responseString;
                  NSData* data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
                  if (data == nil) {
                      return ;
                  }
                  NSError *error = nil;
                  id dict = [NSJSONSerialization  JSONObjectWithData:data options:0 error:&error];
                  if (error) {
                  } else {
//                      [WYJsonToModel convertToModel:dict class:[WYConfig class]];
                  }
              } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
       
              }
     ];
}

- (void)testJson:(NSString *)className
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    if (paths.count == 0) {
        return ;
    }
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", paths[0], @"config.json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    if (data == nil) {
        return ;
    }
    NSError *error = nil;
    id dict = [NSJSONSerialization  JSONObjectWithData:data options:0 error:&error];
    if (error) {
        return ;
    }
}

@end
