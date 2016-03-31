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
#import "WYAudioFontCollectionViewCell.h"
#import "WYAudioPlayUtils.h"

@interface WYPhonematicChartViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    IBOutlet UICollectionView   *_collectionView;
    IBOutlet WYSelectView       *_selectView;
    
    NSArray                     *_noteArray;
    WYAudioPlayUtils            *_audioPlayUtils;
}
@end

@implementation WYPhonematicChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
//    [self initTestView];
    
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
    [_selectView.secondButton setTitle:@"浊音" forState:UIControlStateNormal];
    [_selectView.thirdButton setTitle:@"拗音" forState:UIControlStateNormal];
    
//    UINib *nib = [UINib nibWithNibName:@"WYAudioFontCollectionViewCell"
//                                bundle: [NSBundle mainBundle]];
//    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"wyNoteIndentifier"];
    
//    [_collectionView registerClass:[WYAudioFontCollectionViewCell class] forCellWithReuseIdentifier:@"wyNoteIndentifier"];
}

- (void)initTestView
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.backgroundColor = [UIColor redColor];
    //some initialize code here...
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = barItem;    //not working
    [backButton addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.backBarButtonItem = barItem;
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

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYAudioFontCollectionViewCell *cell = [collectionView
                                  dequeueReusableCellWithReuseIdentifier:@"wyNoteIndentifier"
                                  forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];

    if (indexPath.row < _noteArray.count) {
        WYAudioChat *audioChat = [_noteArray objectAtIndex:indexPath.row];
        
        cell.firstLabel.text = audioChat.romanName;
        cell.secondLabel.text = audioChat.KataKanaName;
        cell.thirdLabel.text = audioChat.HiraganaName;
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat viewWidth = (width - 4 * 5 - 2 * 5) / 5;
    return CGSizeMake(viewWidth, 80);
}

//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout*)collectionViewLayout
//referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeZero;
//}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
//                        layout:(UICollectionViewLayout*)collectionViewLayout
//        insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}

- (void)collectionView:(UICollectionView *)collectionView
                        didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < _noteArray.count) {
        WYAudioChat *audioChat = [_noteArray objectAtIndex:indexPath.row];
        if (!_audioPlayUtils) {
            _audioPlayUtils = [[WYAudioPlayUtils alloc] init];
        }
        [_audioPlayUtils playLocalRresouce:audioChat.romanName];
    }
}

#pragma mark private

- (IBAction)onClicked:(id)sender
{
    
}

@end
