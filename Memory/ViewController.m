//
//  ViewController.m
//  Memory
//
//  Created by YUKIKO HARADA on 2015/05/15.
//  Copyright (c) 2015年 yuki66. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    listTableView.dataSource = self;
    listTableView.delegate = self;
    if(!userInfoArray) {
        userInfoArray = [NSMutableArray new];
    }
    [userInfoArray addObject:@"あいえお"];
    [userInfoArray addObject:@"kakiku"];
    [userInfoArray addObject:@"さささ"];
    [userInfoArray addObject:@"そう"];
    [userInfoArray addObject:@"かきく"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return userInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // セルが作成されていないか?
    if (!cell) { // yes
        // セルを作成
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // セルにテキストを設定
    // セルの内容はNSArray型の「items」にセットされているものとする
    cell.textLabel.text = [userInfoArray objectAtIndex:indexPath.row];
    
    return cell;
}@end
