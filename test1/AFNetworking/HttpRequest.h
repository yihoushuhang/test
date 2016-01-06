//
//  HttpRequest.h
//  自由封装
//
//  Created by Dong on 15/3/30.
//  Copyright (c) 2015年 Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@protocol HttpRequestDelegate <NSObject>

@optional

- (void)requestDataFinish:(id)data notification:(NSString *)str;

- (void)requestDataFail:(id)data notification:(NSString *)str;

@end

@interface HttpRequest : NSObject
{
//    id<HttpRequestDelegate> delegate;
}

@property (nonatomic, assign)id<HttpRequestDelegate> delegate;

- (void)getAFRequestData:(NSDictionary *)dic notification:(NSString *)str url:(NSString *)url;

- (void)postAFRequestData:(NSDictionary *)dic notification:(NSString *)str url:(NSString *)url;

@end
