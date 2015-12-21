//
//  WYJsonToModel.m
//  WYJPLearn
//
//  Created by weiyan on 15/12/18.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import "WYJsonToModel.h"
#import <objc/runtime.h>

@implementation WYJsonToModel

+ (id)convertToModel:(NSDictionary *)dict className:(NSString *)className
{
    id object = [[NSClassFromString(className) alloc] init];
    if (!object) {
        return nil;
    }
    
    NSArray *attrArray = [self propertyNames:[object class]];
    
    NSArray *keyArray = [dict allKeys];
    for (int i = 0; i < keyArray.count; i++) {
        NSString *key = [keyArray objectAtIndex:i];
        id value = [dict objectForKey:key];
        
        for(int j = 0; j < attrArray.count; j++) {
            NSString *str = [attrArray objectAtIndex:j];
            
            if ([key isEqualToString:str]) {
                [object setValue:value forKey:key];
            }
        }
    }
    
    return object;
}

+ (NSArray*)propertyNames:(Class)class
{
    NSMutableArray  *propertyNames = [[NSMutableArray alloc] init];
    unsigned int     propertyCount = 0;
    objc_property_t *properties    = class_copyPropertyList(class, &propertyCount);
    
    for (unsigned int i = 0; i < propertyCount; ++i)
    {
        objc_property_t  property = properties[i];
        const char      *name     = property_getName(property);
        
        [propertyNames addObject:[NSString stringWithUTF8String:name]];
    }
    
    free(properties);
    
    return propertyNames;
}


@end
