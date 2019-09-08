//
//  GTVideoCoverView.m
//  SampleApp
//
//  Created by 杨奇 on 2019/8/16.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import "GTVideoCoverView.h"
#import "GTVideoPlayer.h"
#import "GTVideoToolBar.h"


@interface GTVideoCoverView()


@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *playButton;
@property (nonatomic, copy, readwrite) NSString *videoUrl;
@property (nonatomic, copy, readwrite) GTVideoToolBar *toolBar;
@end

@implementation GTVideoCoverView


- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - GTVideoToolBarHeight)];
            _coverView;
        })];
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50) / 2, (frame.size.height - GTVideoToolBarHeight - 50) / 2, 50, 50)];
            _playButton.image = [UIImage imageNamed:@"play.jpg"];
            _playButton;
        })];
        
        [self addSubview:({
            _toolBar = [[GTVideoToolBar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, GTVideoToolBarHeight )];
            _toolBar;
        })];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGestureRecognizer];
        
        
    }
    return self;
}


#pragma mark - public method
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
    [_toolBar layoutWithModel:nil];
}

#pragma mark - private method
- (void)_tapToPlay {
    //在当前Item上播放视频
    [[GTVideoPlayer Player] playVideoWithUrl:_videoUrl attachView:_coverView];
}
@end
