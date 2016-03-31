//
//  WYPathUtils.h
//  WYJPLearn
//
//  Created by weiyan on 16/3/30.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYPathUtils : NSObject

+ (BOOL)isPathExist:(NSString *)path;
+ (BOOL)isFileExists:(NSString *)filePath;
+ (BOOL)isDirectoryExist:(NSString *)directoryPath;

+ (NSString *)getAppDirectory;//程序的整个根目录
+ (NSString *)getDocumentsDirectory;//根目录下的Documents，会被itunes备份
+ (NSString *)getLibraryCachesDirectory;//Library下的Caches目录，不会被itunes备份，而且系统磁盘不足时候会删除这个文件夹的内容
+ (NSString *)getLibraryCachesInternalDirectory:(NSString *)directoryName;//Caches下面的子目录，业务的存储
+ (NSString *)getDocumentsInternalDirectory:(NSString *)directoryName;//Document下面的子目录
+ (NSString *)getLibraryPreferenceDirectory;//配置文件的目录
+ (NSString *)getLibraryTmpDirectory;//当读取不到系统的tmp文件夹时候用这个来存储，以后清楚缓存的时候直接删除该文件夹
+ (NSString *)getSystemTmpDirectory;//系统的临时目录，每次重新启动app都会被删除

+ (BOOL)createDirectoryPath:(NSString *)directoryPath;

+ (BOOL)moveFile:(NSString *)oldFilePath to:(NSString *)newFilePath;
+ (BOOL)copyFile:(NSString *)oldFilePath to:(NSString *)newFilePath;
+ (BOOL)removeFile:(NSString*)filePath;
+ (BOOL)removePath:(NSString *)path;

+ (NSString *)parseFileNameFromUrl:(NSString *)url;

+ (void)writeData:(NSData *)data toFile:(NSString *)filePath completeBlock:(void (^)(NSError *error))block;

//获取url最后斜杆里面.之后的字符串。如果没有.字符，就返回整个名字
+ (NSString *)getFileExtension:(NSString *)url;


@end
