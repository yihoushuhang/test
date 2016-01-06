//
//  NetWorkHelper.h
//  Music
//
//  Created by yanghang on 15/12/12.
//  Copyright (c) 2015年 yanghang. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef  void (^DoTrans) (NSString *url);

@protocol NetWorkHelperDelegate <NSObject>

//当数据成功获取后使用此方法回调
- (void)networkDataIsSuccessful:(id)obj;


//当数据获取失败后使用此方法回调
- (void)networkDataisFail:(NSError *)error;


@end
@interface NetWorkHelper : NSObject
@property (nonatomic, assign) id<NetWorkHelperDelegate> delegate;
@property (nonatomic, copy) DoTrans blockStr;
- (void)getDataWithUrlString:(NSString *)urlString;
- (void)downLoadMusic:(NSString *)urlString name:(NSString *)name type:(NSString *)type;
- (void)parseDataWithString:(NSString *)urlStr block:(DoTrans)valueBlock;
+ (NSString *)dataPath;
@end
