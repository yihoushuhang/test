//
//  NetWorkHelp.h
//  test1
//
//  Created by 杨航 on 15/11/27.
//  Copyright © 2015年 yanghang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^success) (AFHTTPRequestOperation *operation,id responseObj);
typedef void(^failure)(AFHTTPRequestOperation *operation,NSString * errorMsg);
@interface NetWorkHelp : NSObject

@end
