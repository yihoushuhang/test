//
//  database.m
//  Music
//
//  Created by lanouhn on 15/8/17.
//  Copyright (c) 2015年 yanghang. All rights reserved.
//

#import "database.h"
#import "Music.h"
#import "MusicBigArray.h"
#import "NetWorkHelper.h"
@implementation database
+ (NSString *)databaseFilePath{
    NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [filePath objectAtIndex:0];
    NSString *dbFilePath = [documentPath stringByAppendingPathComponent:@"music.sqlite"];
    NSString * cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
    NSLog(@"%@",cachesPath);
    NSLog(@"%@",documentPath);
    return dbFilePath;
}

+ (void)creatTable:(FMDatabase *)db{
    if (![db open]) {
    }
    [db executeUpdate:@"CREATE TABLE IF NOT EXISTS MUSIC (song_name text primary key, singer_name text, duration text, cachesPath text)"];
}

+ (void)insertMusic:(FMDatabase *)db MusicModel:(Music *)music MusicBigArray:(MusicBigArray *)musicBigArray{
    [db executeUpdate:@"INSERT INTO MUSIC(song_name,singer_name,duration,cachesPath) VALUES(?,?,?,?)",musicBigArray.song_name,musicBigArray.singer_name,music.duration,[[NetWorkHelper dataPath] stringByAppendingString:[NSString stringWithFormat:@"/%@.m4a",musicBigArray.song_name]]];
}

+ (void)deleteMusic:(FMDatabase *)db MusicBigArray:(MusicBigArray *)musicBigArray{
    [db executeUpdate:@"delete from MUSIC where song_name = ?",musicBigArray.song_name];
}




@end
