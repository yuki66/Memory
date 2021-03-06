//
//  ViewController.m
//  Memory
//
//  Created by YUKIKO HARADA on 2015/05/15.
//  Copyright (c) 2015年 yuki66. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    listTableView.dataSource = self;
    listTableView.delegate = self;
    if(!userInfoArray) {
        userInfoArray = [NSMutableArray new];
    }
   else if(userInfoArray == nil){
        userInfoArray = [[NSMutableArray alloc]init];
    }
    NSUserDefaults *ud =[NSUserDefaults standardUserDefaults];
    [ud setObject:userInfoArray forKey:@"mutable"];
    [ud synchronize]; //即時保存
    
    //取り出し
    userInfoArray = [[ud objectForKey:@"mutable"] mutableCopy];
    
    NSLog(@"userInfoArray == %@", userInfoArray);
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
}

-(IBAction)plus{
    [self showAlert];
}
- (void)showAlert {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title" message:@"タイトルを入力してください" delegate:self cancelButtonTitle:@"キャンセル" otherButtonTitles:@"OK", nil];
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            
            break;
        case 1:
            [userInfoArray addObject:[[alertView textFieldAtIndex:0] text]];
            [listTableView reloadData];
            break;
            
        default:
            break;
    }
}



@end
