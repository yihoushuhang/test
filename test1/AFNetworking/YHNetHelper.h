//
//  YHNetHelper.h
//  houseSelling
//
//  Created by 杨航 on 15/11/23.
//  Copyright © 2015年 yanghang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


typedef void (^SuccessBlock)(id result);
typedef void (^FailBlock)(NSError * error);
@interface YHNetHelper : NSObject

- (void)AFPost:(NSString *)urlString parameters:(NSDictionary *)parameters Success:(SuccessBlock)success fail:(FailBlock)fail;

@end
