//
//  WYPhonematicChartViewController.m
//  WYJPLearn
//
//  Created by weiyan on 15/12/21.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import "WYPhonematicChartViewController.h"
#import "WYSelectView.h"
#include "WYMarco.h"
#import "WYServiceManager.h"
#import "WYLessionService.h"
#import "WYAudioChat.h"

@interface WYPhonematicChartViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    IBOutlet UICollectionView   *_collectionView;
    IBOutlet WYSelectView       *_selectView;
    
    NSArray                     *_noteArray;
}
@end

@implementation WYPhonematicChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout alloc] init
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"wyNoteIndentifier"];
    
    WYWeakSelf
    _selectView.callback = ^(int index){
        [weakSelf switchTag:index];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark init
- (void)initViews
{
    [_selectView.firstButton setTitle:@"五十音" forState:UIControlStateNormal];
    [_selectView.firstButton setTitle:@"浊音" forState:UIControlStateNormal];
    [_selectView.firstButton setTitle:@"拗音" forState:UIControlStateNormal];
}

#pragma mark callback

- (void)switchTag:(int)index
{
    WYLessionService *service = [[WYServiceManager sharedObject] getService:@"WYLessionService"];
    _noteArray = [service getAudioArrayByType:index];
    [_collectionView reloadData];
}

#pragma mark UICollectionDataSource  UICollectionDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _noteArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"wyNoteIndentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];

    WYAudioChat *audioChat = [_noteArray objectAtIndex:indexPath.row];
    UILabel *romanLabel = [[UILabel alloc] initWithFrame:cell.bounds];
    romanLabel.text = audioChat.romanName;
    [cell.contentView addSubview:romanLabel];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    CGFloat randomHeight = 80 + (arc4random() % 150);
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat viewWidth = (width - 4 * 5 - 2 * 5) / 5;
    return CGSizeMake(viewWidth, 80);
}

#pragma mark private

@end
