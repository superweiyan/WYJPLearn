//
//  WYSelectView.h
//  WYJPLearn
//
//  Created by weiyan on 16/3/17.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^onClickedByIndexCallback)(int);

@interface WYSelectView : UIView

@property IBOutlet UIButton *firstButton;
@property IBOutlet UIButton *secondButton;
@property IBOutlet UIButton *thirdButton;

@property (nonatomic, copy) onClickedByIndexCallback callback;

@end
