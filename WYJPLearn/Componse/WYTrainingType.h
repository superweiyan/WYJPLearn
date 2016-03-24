//
//  WYTrainingType.h
//  WYJPLearn
//
//  Created by weiyan on 16/3/23.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYTrainingType : NSObject

@end

@interface WYTrainingItemWithThree : NSObject

@property (nonatomic, copy) NSString *firstItem;
@property (nonatomic, copy) NSString *secondItem;
@property (nonatomic, copy) NSString *thirthItem;

@end

@interface WYTraningQuestion : NSObject

@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *fakeAnswerOne;
@property (nonatomic, copy) NSString *fakeAnswerTwo;

@end
