//
//  MFTestModel.h
//  WYJPLearn
//
//  Created by weiyan on 15/12/19.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFTestModel : NSObject

@property (nonatomic, assign) float completed_id;
@property (nonatomic, assign) long long max_id;
@property (nonatomic, strong) NSString*  max_id_str;
@property (nonatomic, copy)   NSArray*  results;

@end
