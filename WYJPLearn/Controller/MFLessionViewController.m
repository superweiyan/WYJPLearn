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
        
        [self loadLession];
    }
    return self;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _tableView.frame = self.view.bounds;
}

- (void)loadLession
{
//    NSError *error = nil;
//    NSString *path = [[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/"] stringByAppendingString:@"japaneseNote.json"];
//    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
}

#pragma mark UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableIndentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableIndentifier"];
    }
    
    cell.textLabel.text = @"五十音图";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
