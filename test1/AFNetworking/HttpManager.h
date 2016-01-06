//
//  HttpManager.h
//  自由封装
//
//  Created by Dong on 15/3/30.
//  Copyright (c) 2015年 Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"

@interface HttpManager : NSObject <HttpRequestDelegate>
{
    HttpRequest *requestData;
    
    NSString *notifictionStr;
}

+(HttpManager *)BaoManInstance;

- (void)setGETRequest:(NSDictionary *)dic notification:(NSString *)str url:(NSString *)url;

- (void)setPOSTRequest:(NSDictionary *)dic notification:(NSString *)str url:(NSString *)url;

@end
