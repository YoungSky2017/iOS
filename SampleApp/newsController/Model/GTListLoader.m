//
//  GTListLoader.m
//  SampleApp
//
//  Created by 杨奇 on 2019/8/13.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListItem.h"

@implementation GTListLoader
- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock {
    
//    [[AFHTTPSessionManager manager] GET:@"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"数据加载成功。");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"数据加载失败。");
//    }];
    NSArray<GTListItem *> *listdata = [self _readDataFromLocal];
    if (listdata) {
        finishBlock(YES, listdata);
    }
    
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listUrl = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listUrl];

    __weak typeof(self)weakSelf = self;
    NSURLSession *listSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [listSession dataTaskWithURL:listUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        __strong typeof(weakSelf)strongSelf = weakSelf;
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

//        NSDictionary *jsonData;
//        NSDictionary *jsonData2 = [jsonObj objectForKey:@"result"];
        NSArray *dataArray = [[jsonObj objectForKey:@"result"] objectForKey:@"data"];

        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
//strongSelf
        [strongSelf _archiveListDataWithArray:listItemArray.copy];
        //将回包放到主线程（收到的数据将要展示在主界面上 ）
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });

        NSLog(@"");
    }];
    [dataTask resume];
    
}

#pragma mark - private method
- (NSArray<GTListItem *> *)_readDataFromLocal {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    //创建文件
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSData *readListData = [fileManager contentsAtPath:listDataPath];
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readListData error:nil];
    if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
        return (NSArray<GTListItem *> *)unarchiveObj;
    }
    return nil;
}

- (void)_archiveListDataWithArray:(NSArray<GTListItem *> *)array {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    //在cache文件夹下新建一个GTData文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    
    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
//    NSData *readListData = [fileManager contentsAtPath:listDataPath];
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readListData error:nil];
    
//    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
//    NSData *testListData = [[NSUserDefaults standardUserDefaults] dataForKey:@"listData"];
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:testListData error:nil];
    
    //查询文件是否存在
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    
    //删除文件
//    if (fileExist) {
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//    //刷新文件中的数据
//    [fileHandler synchronizeFile];
//    //关闭文件操作
//    [fileHandler closeFile];
}
@end
