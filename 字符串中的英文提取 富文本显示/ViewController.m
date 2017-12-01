//
//  ViewController.m
//  字符串中的英文提取 富文本显示
//
//  Created by kys-20 on 2017/11/24.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import "ViewController.h"
#import "NSString+select.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSArray *array = [NSString selectTheEmailOfString:@" wcowfjwogjwoiejfiow 12321@qq.com 2"];
//    NSLog(@"%@",array);
    NSMutableAttributedString *resultString = [NSString changeTheString:@"12321@qq.com 德萨卡 clc_cfzxyq@163.com98349845fwe ctftf:iLoveiOS@qq.com" ByRuchStringInRule:@"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"];
    NSLog(@"%@",resultString);
    
//    NSArray *array =[NSString selectTheEmailOfString:@"12321@qq.com 德萨卡 clc_cfzxyq@163.com98349845fwe ctftf:iLoveiOS@qq.com"];
//    NSLog(@"%@",array);
    
//    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
//    lable.attributedText = resultString;
//    [self.view addSubview:lable];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
