//
//  AppDelegate.m
//  test1
//
//  Created by 杨航 on 15/11/18.
//  Copyright © 2015年 yanghang. All rights reserved.
//  30b0df7893ec4d058dd123f0103ad639

#import "AppDelegate.h"
#import "AFNetworking.h"
#import "timeTool.h"
#define SysVerify @"296014"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    
//    NSDictionary *registerDic =@{@"mobile":@"18203979395",@"password":@"123",@"smsVerify":SysVerify};
//    NSLog(@"注册：%@\n",registerDic);
//    
//    NSDictionary *loginForPasswordDic = @{@"mobile":@"18203979395",@"password":@"123",@"loginType":@"0",@"deviceType":@"1"};
//    NSLog(@"密码登陆：%@\n",loginForPasswordDic);
//
//    NSDictionary *loginForSmsVerydDic = @{@"mobile":@"18203979395",@"smsVerify":SysVerify,@"loginType":@"1",@"deviceType":@"1"};
//    NSLog(@"验证码登陆：%@\n",loginForSmsVerydDic);
//    
//    NSDictionary *updatePasswordDic = @{@"mobile":@"18203979395",@"password":@"123456",@"smsVerify":SysVerify,@"deviceType":@"1"};
//    NSLog(@"修改密码：%@\n",updatePasswordDic);
//    NSDictionary *updateInfoDic = @{@"mobile":@"18203979395",@"userName":@"aobama",@"gender":@"0",@"deviceType":@"1"};
//    NSLog(@"修改昵称：%@\n",updateInfoDic);
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//    manager.requestSerializer.timeoutInterval = 20;
////
//    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"testPicture"]];
//    NSData * imageData = UIImageJPEGRepresentation(imageView.image, 0.5);
//    [manager POST:kNetAddress_publishImages parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
//     {
//         NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
//         NSString *filePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"1.jpg"]];
//        [imageData writeToFile:filePath options:NSDataWritingAtomic error:nil];
//         // 上传的参数名
//         // 上传filename
//         NSString * fileName = [NSString stringWithFormat:@"1.jpg"];
//         if (imageData) {
//             [formData appendPartWithFileData:imageData name:@"fileUpload" fileName:fileName mimeType:@"image/jpg/jpeg/png"];
//         }
//         if (imageData) {
////             NSURL *fileURL = [NSURL fileURLWithPath:filePath];
////             [formData appendPartWithFileURL:fileURL name:@"fileUpload" fileName:fileName mimeType:@"image/jpg/jpeg/png" error:nil];
//         }
//     }
//          success:^(AFHTTPRequestOperation *operation, id responseObject)
//     {
//         NSLog(@"%@",responseObject);
//     }
//          failure:^(AFHTTPRequestOperation *operation, NSError *error)
//     {
//         NSLog(@"%@\n",error);
//     }];
//
   
    


/*****/
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.requestSerializer=[AFJSONRequestSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//    [manager POST:kNetAddress_getHouseList parameters:@{@"pageNo":@"1",@"pageSize":@"10",@"deviceType":@"1"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        ;
//        NSLog(@"%@",responseObject);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"%@",error);
//    }];
//    NSLog(@"%.0d",3000000/100);
    
    
    
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
