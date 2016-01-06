//
//  HttpManager.m
//  自由封装
//
//  Created by Dong on 15/3/30.
//  Copyright (c) 2015年 Dong. All rights reserved.
//

#import "HttpManager.h"
#import "HttpRequest.h"

static HttpManager *sharedInstance = nil;

@implementation HttpManager

- (id)init
{
    if (self=[super init]) {
        requestData = [[HttpRequest alloc] init];
        requestData.delegate = self;
    }
    
    return self;
}
//单例
+ (HttpManager *)BaoManInstance
{
    @synchronized(self){
        if (sharedInstance==nil)
        {
            sharedInstance=[[HttpManager alloc]init];
        }
    }
    return sharedInstance;
}

- (void)setGETRequest:(NSDictionary *)dic notification:(NSString *)str url:(NSString *)url
{
    [requestData getAFRequestData:dic notification:str url:url];
}

- (void)setPOSTRequest:(NSDictionary *)dic notification:(NSString *)str url:(NSString *)url
{
    [requestData postAFRequestData:dic notification:str url:url];
}

// 请求完成的回调代理
- (void)requestDataFinish:(id)data notification:(NSString *)str
{
    [[NSNotificationCenter defaultCenter] postNotificationName:str object:data];
}

// 请求失败的回调代理
- (void)requestDataFail:(id)data notification:(NSString *)str
{
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@",str,FailNotification] object:data];
}

@end
