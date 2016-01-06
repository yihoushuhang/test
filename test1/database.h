//
//  database.h
//  Music
//
//  Created by lanouhn on 15/8/17.
//  Copyright (c) 2015年 yanghang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicBigArray.h"
#import "Music.h"
#import "FMDatabase.h"
@interface database : NSObject
@property (strong, nonatomic) FMDatabase *db;
+ (NSString *)databaseFilePath;
+ (void)creatTable:(FMDatabase *)db;
+ (void)insertMusic:(FMDatabase *)db MusicModel:(Music *)music MusicBigArray:(MusicBigArray *)musicBigArray;
+ (void)deleteMusic:(FMDatabase *)db MusicBigArray:(MusicBigArray *)musicBigArray;

@end
