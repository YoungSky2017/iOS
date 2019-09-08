//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by 杨奇 on 2019/5/21.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import "GTNormalTableViewCell.h"
#import "GTListItem.h"
#import "SDWebImage.h"
#import "GTScreen.h"

@interface GTNormalTableViewCell ()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *sourceLabel;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;
@property (nonatomic, strong, readwrite) UILabel *timeLabel;

@property (nonatomic, strong, readwrite) UIImageView *rightImageView;

@property (nonatomic, strong, readwrite) UIButton *deleteButton;

@end

@implementation GTNormalTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview: ({
            self.titleLabel = [[UILabel alloc] initWithFrame:UIRect(20, 15, 270, 50)];
//            self.titleLabel.backgroundColor = [UIColor yellowColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:UIRect(20, 70, 30, 20)];
//            self.sourceLabel.backgroundColor = [UIColor yellowColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:UIRect(20, 70, 30, 20)];
//            self.commentLabel.backgroundColor = [UIColor yellowColor];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:UIRect(20, 70, 30, 20)];
//            self.timeLabel.backgroundColor = [UIColor yellowColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:UIRect(300, 15, 100, 70)];
            self.rightImageView.backgroundColor = [UIColor lightGrayColor];
            self.rightImageView;
        })];
        
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 70, 25, 20)];
//
//            //删除按钮对应的方法
//            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
//
//            self.deleteButton.layer.cornerRadius = 10;
//            self.deleteButton.layer.masksToBounds = NO;
//
//            self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//            self.deleteButton.layer.borderWidth = 1;
//            self.deleteButton;
//        })];
    }
    return  self;
}

- (void) layoutTableViewCellWithItem:(GTListItem *)item {
    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniqueKey];
    if (hasRead) {
        self.titleLabel.textColor = [UIColor lightGrayColor];
    }else {
        self.titleLabel.textColor = [UIColor blackColor];
    }
    
    self.titleLabel.text = item.title;
    self.titleLabel.font = [UIFont systemFontOfSize:16];
//    self.titleLabel.textColor = [UIColor blackColor];
    
    
    self.sourceLabel.text = item.authorName;
    self.sourceLabel.font = [UIFont systemFontOfSize:12];
    self.sourceLabel.textColor = [UIColor grayColor];
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = item.category;
    self.commentLabel.font = [UIFont systemFontOfSize:12];
    self.commentLabel.textColor = [UIColor grayColor];
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + UI(15), self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    
    self.timeLabel.text = item.date;
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    self.timeLabel.textColor = [UIColor grayColor];
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + UI(15), self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
#warning 没做任何检查匹配
//    NSThread *downloadImageThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        self.rightImageView.image = image;
//    }];
//    downloadImageThread.name = @"downloadImageThread";
//    [downloadImageThread start];
    
//    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
//    dispatch_async(downloadQueue, ^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        dispatch_async(mainQueue, ^{
//            self.rightImageView.image = image;
//        });
//    });
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:item.picUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"");
    }];

    
    self.rightImageView.contentMode = UIViewContentModeScaleToFill;
    
    [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
//    self.deleteButton.tintColor = [UIColor lightGrayColor];
    [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
    [self.deleteButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}
- (void)deleteButtonClick {
//    NSLog(@"click delete button");
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}
@end
