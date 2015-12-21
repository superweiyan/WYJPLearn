//
//  WYJsonToModel.h
//  WYJPLearn
//
//  Created by weiyan on 15/12/18.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYJsonToModel : NSObject

+ (id)convertToModel:(NSDictionary *)dict className:(NSString *)className;

@end
