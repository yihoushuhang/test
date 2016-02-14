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
#import "timeTool.h"
#import "timeModel.h"

#define kWidth self.view.frame.size.width
#define kHeight self.view.frame.size.height
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong)YHNetHelper *helper;
@property (nonatomic, strong)NSMutableArray *dataSourceArray;
@property (nonatomic, copy)NSString *presentTime;
@property (nonatomic, assign)NSInteger indexRow;
@property (nonatomic, strong)NSMutableArray *modelArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    timeTool *tt = [timeTool new];
    UIView *backGroudView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kWidth, 250)];
    [self.view addSubview:backGroudView];
    
    UIPickerView *pickV = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, kWidth, 250)];
    [backGroudView addSubview:pickV];
    pickV.backgroundColor = [UIColor orangeColor];
    
    self.dataSourceArray =  [tt getTimeWithRecently];
    self.presentTime = tt.presentTime;
    self.indexRow = [self.dataSourceArray indexOfObject:self.presentTime];
    for (timeModel *a in tt.selectDate) {
        NSLog(@"%@--%@--%@",a.month,a.day,a.week);
    }
    [self.dataSourceArray replaceObjectAtIndex:self.indexRow withObject:@"今  天"];
    [self.dataSourceArray replaceObjectAtIndex:self.indexRow - 1 withObject:@"昨  天"];
    [self.dataSourceArray replaceObjectAtIndex:self.indexRow + 1 withObject:@"明  天"];
    pickV.delegate = self;
    pickV.dataSource = self;
    [pickV selectRow:self.indexRow inComponent:0 animated:YES];
}

- (NSMutableArray *)dataSourceArray {
    if (!_dataSourceArray) {
        self.dataSourceArray = [NSMutableArray array];
    }
    return _dataSourceArray;
}

- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        self.modelArray = [NSMutableArray array];
    }
    return _modelArray;
}
//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
//每列的数据有多少
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataSourceArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.dataSourceArray objectAtIndex:row];
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
