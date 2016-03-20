//
//  WYServiceManager.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/17.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYServiceManager.h"
#import <objc/runtime.h>

@interface WYServiceManager()
{
    NSMutableArray *_serviceNameArray;
}
@end

@implementation WYServiceManager

+ (instancetype)sharedObject
{
    static dispatch_once_t __once;
    static WYServiceManager * __instance = nil;
    dispatch_once(&__once, ^{
        __instance = [[WYServiceManager alloc] init];
    });
    return __instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _serviceNameArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)registerServiceName:(NSString *)serviceName
{
    if (![self hadService:serviceName]) {
        id object = [[NSClassFromString(serviceName) alloc] init];
        [_serviceNameArray addObject:object];
    }
}

- (id)getService:(NSString *)serviceName
{
    return [self hadService:serviceName];
}

- (id)hadService:(NSString *)serviceName
{
    for (int i = 0; i < _serviceNameArray.count; i++) {
        id service = [_serviceNameArray objectAtIndex:i];
        
        NSString *name = NSStringFromClass([service class]);
        if ([serviceName isEqualToString:name]) {
            return service;
        }
    }
    return nil;
}

@end
