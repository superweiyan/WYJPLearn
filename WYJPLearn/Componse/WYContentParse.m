//
//  WYContentParse.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/24.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYContentParse.h"
#import "WYTrainingType.h"

@implementation WYContentParse

+ (NSArray *)parseTypeForThree:(NSArray *)array
{
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < array.count; i++) {
        NSArray *itemInfo = [array objectAtIndex:i];
        WYTrainingItemWithThree *item = [[WYTrainingItemWithThree alloc] init];
        item.firstItem = [itemInfo objectAtIndex:0];
        item.secondItem = [itemInfo objectAtIndex:1];
        item.thirthItem = [itemInfo objectAtIndex:2];
        
        [newArray addObject:item];
    }
    return newArray;
}

@end
