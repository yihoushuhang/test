//
//  AppDelegate.h
//  test1
//
//  Created by 杨航 on 15/11/18.
//  Copyright © 2015年 yanghang. All rights reserved.
//  461684

#import <UIKit/UIKit.h>

#define HTTP @"http://192.168.2.19:8080/"
#define PORT @"fang/a/house/user/app/onlineUser/"
#define PORT2 @"fang/a/house/user/app/erhouse/"
#define CONCAT_x(a, b, c) a b#c


#define kNetAddress_getSmsVery CONCAT_x(HTTP, PORT, getSmsVerify)
#define kNetAddress_register CONCAT_x(HTTP, PORT, registUser)
#define kNetAddress_login CONCAT_x(HTTP, PORT, login)
#define kNetAddress_updatePassWord CONCAT_x(HTTP, PORT, updatePassWord)
#define kNetAddress_updateInfo CONCAT_x(HTTP, PORT, updateUserInfo)
#define kNetAddress_publishHouse CONCAT_x(HTTP, PORT2, publisherHouse)
#define kNetAddress_publishImages CONCAT_x(HTTP, PORT2, getUpLoadFilePath)
#define kNetAddress_publishRoom @""
#define kNetAddress_getHouseList CONCAT_x(HTTP, PORT2, getErHouseList)
#define kNetAddress_getHouseInfo CONCAT_x(HTTP, PORT2, getErHouseInfo)
#define kNetNSString @"房子在九龙花园小区，环境优美，绿化充足，\n位于朝阳-双井广渠路29号双井桥东200米家乐福西50米，入住即与精英为邻；\n该房2室，1厅，1卫户型，房间配套有床，宽带，电视，冰箱，洗衣机，空调，热水器，暖气，\n交通便利，附近的公交：23路、34路、35路、37路、829路、\n907路公交；特8、特8、特8、特8、特8、特8、\n14号线,房子在九龙花园小区，环境优美，绿化充足，\n位于朝阳-双井广渠路29号双井桥东200米家乐福西50米，入住即与精英为邻；\n该房2室，1厅，1卫户型，房间配套有床，宽带，电视，冰箱，洗衣机，空调，热水器，暖气，\n交通便利，附近的公交：23路、34路、35路、37路、829路、\n907路公交；特8、特8、特8、特8、特8、特8"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

