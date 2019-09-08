//
//  GTVideoPlayer.h
//  SampleApp
//
//  Created by 杨奇 on 2019/8/16.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoPlayer : NSObject
/**
 全局播放器单例
 */
+ (GTVideoPlayer *)Player;

/**
 在指定View上 通过url播放视频
 */
- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView;
@end

NS_ASSUME_NONNULL_END
