//
//  timeTool.h
//  test1
//
//  Created by 杨航 on 16/2/1.
//  Copyright © 2016年 yanghang. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface timeTool : NSObject {
    NSString *weekString;
    NSInteger month;
    NSInteger day;
    NSInteger year;
}
@property (nonatomic, copy)NSString *presentTime;
@property (nonatomic, strong)NSMutableArray *selectDate;
- (NSMutableArray *)getTimeWithRecently;

@end
