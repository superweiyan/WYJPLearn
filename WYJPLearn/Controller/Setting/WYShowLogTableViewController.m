//
//  WYShowLogTableViewController.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/30.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYShowLogTableViewController.h"
#import "WYLogService.h"
#import "WYServiceManager.h"

@interface WYShowLogTableViewController ()
{
    NSArray *_loglines;
}
@end

@implementation WYShowLogTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadReceLog];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _loglines.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *wyLogInfoReuseIdentifier = @"wyLogInfoReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:wyLogInfoReuseIdentifier
                                                            forIndexPath:indexPath];
    cell.textLabel.font = [UIFont systemFontOfSize:10.0];
    cell.textLabel.numberOfLines = 0;
    
    if (indexPath.row < _loglines.count) {
        NSString *logInfo = [_loglines objectAtIndex:indexPath.row];
        cell.textLabel.text = logInfo;
    }
    
    return cell;
}

#pragma mark private

- (void)loadReceLog
{
    WYLogService *logService = [[WYServiceManager sharedObject] getService:@"WYLogService"];
    NSString *filePath = [logService getLog];
    NSError *error;
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        return ;
    }
    
    _loglines = [fileContent componentsSeparatedByString:@"\n"];
    [self.tableView reloadData];
}

@end
