//
//  AppDelegate.m
//  test1
//
//  Created by 杨航 on 15/11/18.
//  Copyright © 2015年 yanghang. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworking.h"
#define SysVerify @"296014"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSDictionary *registerDic =@{@"mobile":@"18203979395",@"password":@"123",@"smsVerify":SysVerify};
    NSLog(@"注册：%@\n",registerDic);
    
    NSDictionary *loginForPasswordDic = @{@"mobile":@"18203979395",@"password":@"123",@"loginType":@"0",@"deviceType":@"1"};
    NSLog(@"密码登陆：%@\n",loginForPasswordDic);

    NSDictionary *loginForSmsVerydDic = @{@"mobile":@"18203979395",@"smsVerify":SysVerify,@"loginType":@"1",@"deviceType":@"1"};
    NSLog(@"验证码登陆：%@\n",loginForSmsVerydDic);
    
    NSDictionary *updatePasswordDic = @{@"mobile":@"18203979395",@"password":@"123456",@"smsVerify":SysVerify,@"deviceType":@"1"};
    NSLog(@"修改密码：%@\n",updatePasswordDic);
    NSDictionary *updateInfoDic = @{@"mobile":@"18203979395",@"userName":@"aobama",@"gender":@"0",@"deviceType":@"1"};
    NSLog(@"修改昵称：%@\n",updateInfoDic);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager POST:kNetAddress_getSmsVery parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@",[responseObject[@"resInfo"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
//
    
/*****/
//    NSURL *url = [NSURL URLWithString:kNetAddress_login];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    request.HTTPMethod = @"POST";
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    NSData *data = [NSJSONSerialization dataWithJSONObject:dic3 options:NSJSONWritingPrettyPrinted error:nil];
//    request.HTTPBody = data;
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        NSString *result = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
//                 NSLog(@"%@",result);
//            }];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
