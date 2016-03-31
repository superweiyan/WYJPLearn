//
//  WYSelectView.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/17.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYSelectView.h"
#include "WYMarco.h"

@interface WYSelectView()
{

}
@end

@implementation WYSelectView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    [super awakeFromNib];
    NSArray *WYSelectViewXib = [[NSBundle mainBundle] loadNibNamed:@"WYSelectView" owner:self options:nil];
    UIView *contentView = [WYSelectViewXib objectAtIndex:0];
    [self addSubview:contentView];
}

- (IBAction)onFirstBtnClicked:(id)sender
{
    safeCallblock(self.callback, 0);
}

- (IBAction)onSecondBtnClicked:(id)sender
{
    safeCallblock(self.callback, 1);
}

- (IBAction)onThirdBtnClicked:(id)sender
{
    safeCallblock(self.callback, 2);
}



@end
