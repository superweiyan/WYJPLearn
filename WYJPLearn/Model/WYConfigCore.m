//
//  WYConfigCore.m
//  WYJPLearn
//
//  Created by weiyan on 15/12/18.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import "WYConfigCore.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

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
    }
    return self;

}

- (void)querySoundMarkConfig
{
    [_httpManager GET:@"http://120.25.226.101/WYSoundmark.json"
           parameters:nil
              success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                  NSData *data = responseObject;
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
       
    }];
}



@end
