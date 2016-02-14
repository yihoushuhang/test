//
//  timeTool.m
//  test1
//
//  Created by 杨航 on 16/2/1.
//  Copyright © 2016年 yanghang. All rights reserved.
//

#import "timeTool.h"
#import "timeModel.h"
@implementation timeTool

- (NSMutableArray *)getTimeWithRecently {
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    long long int date = (long long int)time;
    //把秒数转化成yyyy-MM-dd hh:mm:ss格式
    NSDate *dd = [NSDate dateWithTimeIntervalSince1970:date];
    NSLog(@"d:%@",dd);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour |NSCalendarUnitSecond | NSCalendarUnitSecond;
    now = [NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    NSInteger week = [comps weekday];
    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期六",@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",nil];
    weekString = arrWeek[week];
    month = [comps month];
    day = [comps day];
    year = [comps year];
    self.presentTime = [NSString stringWithFormat:@"%ld月%ld日 %@",month,day,weekString];
//    NSLog(@"-----------weekday is %@",arrWeek[week]);
//    NSLog(@"-----------month is %ld",month);
//    NSLog(@"-----------day is %ld",day);
//    NSLog(@"-----------year is %ld",year);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 1; i <= 12; i++) {
        switch(i)
        {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:day=31;break;
            case 4:
            case 6:
            case 9:
            case 11:day=30;break;
            case 2:
            {
                if((year%4==0 &&(year%100)!=0)||year%400==0){
                    day = 29;break;
                }
                else{
                    day = 28;break;
                }
                break;
            }
        }
        NSMutableArray *subArray = [NSMutableArray array];
        NSMutableArray *subArray2 = [NSMutableArray array];
        for (int j = 1; j <= day; j++) {
            NSString *weekStr = [self getWeek:year month:i day:j];
            NSString *modelWithWeek = [weekStr stringByReplacingCharactersInRange:NSMakeRange(0,2) withString:@"周"];
            timeModel *tModel = [timeModel new];
            tModel.month = [NSString stringWithFormat:@"%d",i];
            tModel.day = [NSString stringWithFormat:@"%d",j];
            tModel.week = modelWithWeek;
            [subArray2 addObject:tModel];
            [subArray addObject:[NSString stringWithFormat:@"%d月%d日 %@",i,j,weekStr]];
        }
        [array addObject:subArray];
        [modelArray addObject:subArray2];
    }
    NSMutableArray *c = [NSMutableArray array];
    for (NSMutableArray *a in array) {
        for (NSString *b in a) {
            [c addObject:b];
        }
    }
    self.selectDate = [NSMutableArray array];
    for (NSMutableArray *a in modelArray) {
        for (timeModel *b in a) {
            [self.selectDate addObject:b];
        }
    }
    return c;
}

- (NSString *)getWeek:(NSInteger)y month:(NSInteger)m day:(NSInteger)d{
    if (m == 1) {
        m = 13;
    }else if (m == 2){
        m = 14;
    }
    int a = (d+2*m+3*(m+1)/5+y+y/4-y/100+y/400)%7;
    NSString *weekstr = @"";
    switch(a)
    {
        case 0: weekstr = @"星期六"; break;
        case 1: weekstr = @"星期日"; break;
        case 2: weekstr = @"星期一"; break;
        case 3: weekstr = @"星期二"; break;
        case 4: weekstr = @"星期三"; break;
        case 5: weekstr = @"星期四"; break;
        case 6: weekstr = @"星期五"; break;
    }
    return weekstr;
}


@end
