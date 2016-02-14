//
//  YHNetHelper.m
//  houseSelling
//
//  Created by 杨航 on 15/11/23.
//  Copyright © 2015年 yanghang. All rights reserved.
//

#import "YHNetHelper.h"
#import "AFNetworking.h"

@interface YHNetHelper ()
@property (nonatomic, copy)SuccessBlock success;
@property (nonatomic, copy)FailBlock failed;
@end
@implementation YHNetHelper

//+ (void)AFGet:(NSString*)urlString parameters:(NSDictionary *)parameters
//      success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
//      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer=[AFJSONRequestSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    manager.requestSerializer.timeoutInterval = 15;
//    [manager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
//}


//+ (void)AFPost:(NSString*)urlString parameters:(NSDictionary *)parameters
//       success:(successData)responseObject
//       failure:(failureData)failure{
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.requestSerializer=[AFJSONRequestSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    manager.requestSerializer.timeoutInterval = 15;
//    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//
//    }];
//}

- (void)AFPost:(NSString *)urlString parameters:(NSDictionary *)parameters Success:(SuccessBlock)success fail:(FailBlock)fail{
    self.success = success;
    self.failed = fail;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
//    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/javascript"];
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"JSON: %@",[responseObject[@"resMsg"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
        NSLog(@"%@",responseObject);
        self.success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        self.failed(error);
    }];
}


@end
