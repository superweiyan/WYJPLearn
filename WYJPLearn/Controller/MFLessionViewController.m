//
//  MFLessionViewController.m
//  WYJPLearn
//
//  Created by weiyan on 15/12/23.
//  Copyright © 2015年 LWY. All rights reserved.
//

#import "MFLessionViewController.h"

CGFloat kWYGigWidth = 80;
CGFloat kWYGigHeight = 110;

@interface MFLessionViewController()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    
    NSArray *_lessonTitle;
}
@end

@implementation MFLessionViewController

- (id)init
{
    self = [super init];
    if (self) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
        _lessonTitle = @[@"五十音", @"浊音", @"拗音"];
    }
    return self;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _tableView.frame = self.view.bounds;
}

#pragma mark UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _lessonTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableIndentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableIndentifier"];
    }
    
    if (indexPath.row < _lessonTitle.count) {
        NSString *title = [_lessonTitle objectAtIndex:indexPath.row];
        cell.textLabel.text = title;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
