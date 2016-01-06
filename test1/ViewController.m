//
//  ViewController.m
//  test1
//
//  Created by 杨航 on 15/11/18.
//  Copyright © 2015年 yanghang. All rights reserved.
//

#import "ViewController.h"
#import "YHNetHelper.h"
#import "AppDelegate.h"
#import "NetWorkHelper.h"
@interface ViewController ()
@property (nonatomic, strong)YHNetHelper *helper;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.helper = [YHNetHelper new];
//        NSDictionary *dic =@{@"mobile":@"13260102033",@"password":@"13260102033",@"loginType":@"13260102033",@"deviceType":@"1"};
//    
//    [self.helper AFPost:kNetAddress_login parameters:dic Success:^(id result) {
//        
//        NSLog(@"成功");
//    } fail:^(NSError *error) {
//        NSLog(@"%@",error);
//        NSLog(@"失败");
//    }];

//    UIView *aa = [[UIView alloc]initWithFrame:CGRectMake(150, 300, 160, 160)];
//    [self.view addSubview:aa];
//    aa.backgroundColor = [UIColor redColor];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = [UIColor orangeColor];
//    btn.frame = CGRectMake(50, 055, 60,60);
//    [aa addSubview:btn];
}

- (void)test {
//    NetWorkHelper *helper = [[NetWorkHelper alloc]init];
//    helper.delegate = self;
//    [helper downLoadMusic:@"http://tingge.5nd.com/20060919/w/2005510/72041/264421.mp3?000" name:@"我的失忆男友" type:@"mp3"];
//    NSLog(@"路径：%@",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject]);
}


- (void)networkDataIsSuccessful:(id)obj {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
