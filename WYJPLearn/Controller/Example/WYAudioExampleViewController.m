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
    WYTraningQuestion *trainingQuestion = [_exampleService generateQuestion:WYTraningParserAudioType
                                                                paramOption:1];
    self.questionLabel.text = trainingQuestion.question;
}

@end
