//
//  WYNumberUtils.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/28.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYNumberUtils.h"

@implementation WYNumberUtils

+ (NSArray *)genernateNumber:(NSUInteger)count
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < count; i++) {
        [array addObject:@(i)];
    }
    NSMutableArray *unsortArray = [[NSMutableArray alloc] init];
    
    while (array.count > 0) {
        NSUInteger unsortIndex = arc4random() % array.count;
        NSNumber *selectIndex = [array objectAtIndex:unsortIndex];
        [unsortArray addObject:selectIndex];
        [array removeObjectAtIndex:unsortIndex];
    }
    return unsortArray;
}


@end
