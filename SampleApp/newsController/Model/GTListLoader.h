//
//  GTListLoader.h
//  SampleApp
//
//  Created by 杨奇 on 2019/8/13.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "GTListItem.h"

@class GTListItem;

NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);


@interface GTListLoader : NSObject
- (void)loadListDataWithFinishBlock: (GTListLoaderFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
