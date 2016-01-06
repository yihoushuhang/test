//
//  NetWorkHelper.h
//  Music
//
//  Created by lanouhn on 15/8/12.
//  Copyright (c) 2015年 yanghang. All rights reserved.
//
typedef  void (^DoTransManages) (NSString *url);
#import <Foundation/Foundation.h>


@protocol NetWorkHelperDelegate <NSObject>

//当数据成功获取后使用此方法回调
- (void)networkDataIsSuccessful:(id)obj;


//当数据获取失败后使用此方法回调
- (void)networkDataisFail:(NSError *)error;


@end
@interface NetWorkHelper : NSObject
@property (nonatomic, assign) id<NetWorkHelperDelegate> delegate;
@property (nonatomic, copy) DoTransManages blockStr;
- (void)getDataWithUrlString:(NSString *)urlString;
- (void)downLoadMusic:(NSString *)urlString name:(NSString *)name type:(NSString *)type;
- (void)parseDataWithString:(NSString *)urlStr block:(DoTransManages)valueBlock;
+ (NSString *)dataPath;
@end
