//
//  WYAudioExampleViewController.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/24.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYAudioExampleViewController.h"
#import "WYServiceManager.h"
#import "WYExampleService.h"
#import "WYTrainingType.h"

@interface WYAudioExampleViewController ()
{
    WYExampleService *_exampleService;
    WYTraningQuestion *_trainingQuestion;
}

@end

@implementation WYAudioExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _exampleService = [[WYServiceManager sharedObject] getService:@"WYExampleService"];
    
    [self generateQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)generateQuestion
{
    _trainingQuestion = [_exampleService generateQuestion:WYTraningParserAudioType
                                                                paramOption:1];
    self.questionLabel.text = _trainingQuestion.question;
    
    NSArray *itemArray = @[_trainingQuestion.answer,
                                  _trainingQuestion.fakeAnswerOne,
                                  _trainingQuestion.fakeAnswerTwo];
    
    NSArray *queue = [self genernateNumber:itemArray.count];
    
    for (int i = 0; i < queue.count; i++) {
        NSNumber *index = [queue objectAtIndex:i];
        NSString *answerString = [itemArray objectAtIndex:index.longLongValue];
        UIButton *btn = [self.view viewWithTag:(i+1)];
        [btn setTitle:answerString forState:UIControlStateNormal];
    }
}

- (NSArray *)genernateNumber:(NSUInteger)count
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

- (IBAction)onAnswerOneBtnClicked:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSString *title = btn.titleLabel.text;
    [self checkAnswerRight:title];
}

- (IBAction)onAnswerTwoBtnClicked:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSString *title = btn.titleLabel.text;
    [self checkAnswerRight:title];
}

- (IBAction)onAnswerThreeBtnClicked:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSString *title = btn.titleLabel.text;
    [self checkAnswerRight:title];
}

- (BOOL)checkAnswerRight:(NSString *)answer
{
    if ([answer isEqualToString:_trainingQuestion.answer]) {
        return TRUE;
    }
    return FALSE;
}

@end
