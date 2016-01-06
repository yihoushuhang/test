//
//  HttpRequest.m
//  自由封装
//
//  Created by Dong on 15/3/30.
//  Copyright (c) 2015年 Dong. All rights reserved.
//

#import "HttpRequest.h"
#import "AFNetworking.h"

@implementation HttpRequest

// get请求
- (void)getAFRequestData:(NSDictionary *)dic notification:(NSString *)str url:(NSString *)url
{
    AFHTTPRequestOperationManager *homeRequest = [AFHTTPRequestOperationManager manager];
    
    NSString *HostUrl = [NSString stringWithFormat:@"%@%@",BASEURL,url];
    
    [homeRequest GET:HostUrl  parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [self requestFinish:responseObject notification:str];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self requestFail:error notification:str];
        
    } ];
}
// post请求
- (void)postAFRequestData:(NSDictionary *)dic notification:(NSString *)str url:(NSString *)url
{
    
    AFHTTPRequestOperationManager *homeRequest = [AFHTTPRequestOperationManager manager];
    
    NSString *HostUrl = [NSString stringWithFormat:@"%@%@",BASEURL,url];
    
    [homeRequest.requestSerializer setValue:[LZWHelp valueForKey:kUserDefaultsCookie] forHTTPHeaderField:@"Cookie"];
    
    NSLog(@"%@",[LZWHelp valueForKey:kUserDefaultsCookie]);
    
    
    
    [homeRequest POST:HostUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *cookieLong = operation.response.allHeaderFields[@"Set-Cookie"];
        
        NSLog(@"%@",operation.response.allHeaderFields);
        
        NSLog(@"%@",cookieLong);
        
        if (![[LZWHelp valueForKey:@"first"] isEqualToString:@"first"]) {
            [LZWHelp setValue:cookieLong forKey:kUserDefaultsCookie];
            [LZWHelp setValue:@"first" forKey:@"first"];
        }
        
        
        if ([responseObject[@"status"] isEqualToNumber:@403]) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:KCookieLost object:nil];
            return;
        }
        
        [self requestFinish:responseObject notification:str];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self requestFail:error notification:str];
        
    }];
    
}



// 请求成功
- (void)requestFinish:(id)data notification:(NSString *)str
{
    
    // 回调代理
    if ([self.delegate respondsToSelector:@selector(requestDataFinish:notification:)]) {
        
        [self.delegate requestDataFinish:data notification:str];
    }
}
// 请求失败
- (void)requestFail:(id)data notification:(NSString *)str
{
    
    // 回调代理
    if ([self.delegate respondsToSelector:@selector(requestDataFail:notification:)]) {
        
        [self.delegate requestDataFail:data notification:str];
    }
}

@end
