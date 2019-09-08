//
//  GTVideoToolBar.m
//  SampleApp
//
//  Created by 杨奇 on 2019/8/16.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import "GTVideoToolBar.h"

@interface GTVideoToolBar()

@property (nonatomic, strong, readwrite) UIImageView *avatorImageView;
@property (nonatomic, strong, readwrite) UILabel *nickLabel;

@property (nonatomic, strong, readwrite) UIImageView *commentImageView;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;

@property (nonatomic, strong, readwrite) UIImageView *likeImageView;
@property (nonatomic, strong, readwrite) UILabel *likeLabel;

@property (nonatomic, strong, readwrite) UIImageView *shareImageView;
@property (nonatomic, strong, readwrite) UILabel *shareLabel;

@end

@implementation GTVideoToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:({
            _avatorImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _avatorImageView.layer.masksToBounds = YES;
            _avatorImageView.layer.cornerRadius = 15;
            _avatorImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _avatorImageView;
        })];
        [self addSubview:({
            _nickLabel = [[UILabel alloc] init];
            _nickLabel.font = [UIFont systemFontOfSize:15];
            _nickLabel.textColor = [UIColor lightGrayColor];
            _nickLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _nickLabel;
        })];
        [self addSubview:({
            _commentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _commentImageView.layer.masksToBounds = YES;
            _commentImageView.layer.cornerRadius = 15;
            _commentImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _commentImageView;
        })];
        [self addSubview:({
            _commentLabel = [[UILabel alloc] init];
            _commentLabel.font = [UIFont systemFontOfSize:15];
            _commentLabel.textColor = [UIColor lightGrayColor];
            _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _commentLabel;
        })];
        [self addSubview:({
            _likeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _likeImageView.layer.masksToBounds = YES;
            _likeImageView.layer.cornerRadius = 15;
            _likeImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _likeImageView;
        })];
        [self addSubview:({
            _likeLabel = [[UILabel alloc] init];
            _likeLabel.font = [UIFont systemFontOfSize:15];
            _likeLabel.textColor = [UIColor lightGrayColor];
            _likeLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _likeLabel;
        })];
        [self addSubview:({
            _shareImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _shareImageView.layer.masksToBounds = YES;
            _shareImageView.layer.cornerRadius = 15;
            _shareImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _shareImageView;
        })];
        [self addSubview:({
            _shareLabel = [[UILabel alloc] init];
            _shareLabel.font = [UIFont systemFontOfSize:15];
            _shareLabel.textColor = [UIColor lightGrayColor];
            _shareLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _shareLabel;
        })];
    }
    return self;
}

- (void)layoutWithModel:(id)model {
    _avatorImageView.image = [UIImage imageNamed:@"apple.png"];
    _nickLabel.text = @"Apple";
    
    _commentImageView.image = [UIImage imageNamed:@"apple.png"];
    _commentLabel.text = @"101";

    _likeImageView.image = [UIImage imageNamed:@"apple"];
    _likeLabel.text = @"99";
    
    _shareImageView.image = [UIImage imageNamed:@"apple.png"];
    _shareLabel.text = @"分享";
    
    [self autoLayoutConstraintWithToolBar];

#warning Attention: autoLayoutConstraintWithVFL has a problem
//    [self autoLayoutConstraintWithVFL];
    
    
}

#pragma mark - 自动布局的两种方式之 1
- (void)autoLayoutConstraintWithToolBar {
    [NSLayoutConstraint activateConstraints:@[
                                              //logo位置AutoLayout
                                              [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:15],
                                              [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
                                              [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
                                              //nickLabel
                                              [NSLayoutConstraint constraintWithItem:_nickLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_avatorImageView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_nickLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_avatorImageView attribute:NSLayoutAttributeRight multiplier:1 constant:0],
                                              
                                              //commentImageView
                                              [NSLayoutConstraint constraintWithItem:_commentImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_commentImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_commentLabel attribute:NSLayoutAttributeLeft multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_commentImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
                                              [NSLayoutConstraint constraintWithItem:_commentImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
                                              [NSLayoutConstraint constraintWithItem:_commentLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_commentLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_likeImageView attribute:NSLayoutAttributeLeft multiplier:1 constant:-15],
                                              
                                              //likeImageView
                                              [NSLayoutConstraint constraintWithItem:_likeImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_likeImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_likeLabel attribute:NSLayoutAttributeLeft multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_likeImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
                                              [NSLayoutConstraint constraintWithItem:_likeImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
                                              [NSLayoutConstraint constraintWithItem:_likeLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_likeLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_shareImageView attribute:NSLayoutAttributeLeft multiplier:1 constant:-15],
                                              //
                                              //shareImageView
                                              [NSLayoutConstraint constraintWithItem:_shareImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_shareLabel attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_shareImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_shareLabel attribute:NSLayoutAttributeLeft multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_shareImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
                                              [NSLayoutConstraint constraintWithItem:_shareImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
                                              [NSLayoutConstraint constraintWithItem:_shareLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_shareLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-10]
                                              
                                              ]];
}
- (void)autoLayoutConstraintWithVFL {
    [NSLayoutConstraint activateConstraints:@[
                                              //logo位置AutoLayout
                                              [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:15],
                                              [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
                                              [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
                                              //nickLabel
                                              [NSLayoutConstraint constraintWithItem:_nickLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_avatorImageView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                              [NSLayoutConstraint constraintWithItem:_nickLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_avatorImageView attribute:NSLayoutAttributeRight multiplier:1 constant:0],
                                              ]];
    NSString *VFLString =@"H:|-15-[_avatorImageView]-0-[_nickLabel]-(>=0)-[_commentImageView(==_avatorImageView)]-0-[_commentLabel]-15-[_likeImageView(==_avatorImageView)]-0-[_likeLabel]-15-[_shareImageView(==_avatorImageView)]-0-[_shareLabel]-15-|";
    [NSLayoutConstraint constraintsWithVisualFormat:VFLString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_avatorImageView,_nickLabel,_commentImageView,_commentLabel,_likeImageView,_likeLabel,_shareImageView,_shareLabel)];
}

@end
