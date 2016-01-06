//
//  NetWorkHelper.m
//  Music
//
//  Created by yanghang on 15/12/12.
//  Copyright (c) 2015年 yanghang. All rights reserved.
//

#import "NetWorkHelper.h"
#import "AFNetworking.h"
@interface NetWorkHelper ()
//此私有属性用于保存从服务器获取到的数据
@property (nonatomic, retain) NSMutableData * data;
@end

@implementation NetWorkHelper

- (NSMutableData *)data{
    if (!_data) {
        self.data = [NSMutableData data];
    }
    return _data;
}

- (void)getDataWithUrlString:(NSString *)urlString{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.data = responseObject;
        [_delegate networkDataIsSuccessful:self.data];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [_delegate networkDataisFail:error];
    }];
}

- (void)downLoadMusic:(NSString *)urlString name:(NSString *)name type:(NSString *)type{
    NSURLSessionConfiguration *configration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configration];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
//            NSLog(@"下载音乐出错了:%@",error);
        }else{
            [(NSData *)responseObject writeToFile:[self dataPath:name type:type] atomically:YES];
//            NSLog(@"下载成功！");
        }
    }];
    [dataTask resume];
}

- (NSString *)dataPath:(NSString *)name type:(NSString *)type{
    return [[NetWorkHelper dataPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@.%@",name,type]];
}

+ (NSString *)dataPath{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
}
//- (void)blockPassTheUrl:(NSString *)inputWord {
//    NSString *processWord = [inputWord stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString * a = [NSString stringWithFormat:@"http://so.ard.iyyin.com/s/song_with_out?q=%@&page=1&size=50&app=ttpod&v=v7.7.0.2015012818&uid=&mid=iPhone5S&f=f320&s=s310&imsi=&hid=&splus=8.1.3&active=1&net=2&openudid=83d9b5e8051c77c9802f33613002f5327716b5f9&idfa=6B520E7D-63C9-4C81-A0A7-4A583D11DB03&utdid=VDGWeCSpLzUDAP0DVbSpSVq9&alf=201200",processWord];
//    self.blockStr(a);
//}


- (void)parseDataWithString:(NSString *)urlStr block:(DoTrans)valueBlock
{
    NSString *processWord = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * a = [NSString stringWithFormat:@"http://so.ard.iyyin.com/s/song_with_out?q=%@&page=1&size=50&app=ttpod&v=v7.7.0.2015012818&uid=&mid=iPhone5S&f=f320&s=s310&imsi=&hid=&splus=8.1.3&active=1&net=2&openudid=83d9b5e8051c77c9802f33613002f5327716b5f9&idfa=6B520E7D-63C9-4C81-A0A7-4A583D11DB03&utdid=VDGWeCSpLzUDAP0DVbSpSVq9&alf=201200",processWord];
    valueBlock(a);
}




@end
