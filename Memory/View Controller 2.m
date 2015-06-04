//
//  View Controller 2.m
//  Memory
//
//  Created by YUKIKO HARADA on 2015/06/03.
//  Copyright (c) 2015年 yuki66. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation View Controller 2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // タッチをどれか一つ取り出す。
    // anyObjectはNSSetのメソッド。　適当に一つ返してくれる。
    UITouch *t = [touches anyObject];
    
    // 画面上の座標を取得
    CGPoint point = [t locationInView:self.view];
    
    // タッチされたところにView
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    view.center = point;
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
}



@end
