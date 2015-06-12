//
//  ViewController.h
//  Memory
//
//  Created by YUKIKO HARADA on 2015/05/15.
//  Copyright (c) 2015年 yuki66. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController:UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *listTableView;
    NSMutableArray *userInfoArray;
    }
-(IBAction)plus;

@end

