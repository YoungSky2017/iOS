//
//  GTRecommendViewController.m
//  SampleApp
//
//  Created by 杨奇 on 2019/5/20.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()

@end

@implementation GTRecommendViewController

- (instancetype) init {
    if (self = [super init]) {
//        recommendController.view.backgroundColor = [UIColor yellowColor];
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"like_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    
    NSArray *colorArray = @[[UIColor redColor], [UIColor brownColor], [UIColor blueColor], [UIColor grayColor], [UIColor lightGrayColor]];
    
    for (int i = 0; i < 5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
//    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
    [scrollView addSubview:({
        UIButton *buttonView = [[UIButton alloc] initWithFrame:CGRectMake(0, 150, 150, 150)];
        buttonView.backgroundColor = [UIColor whiteColor];
        [buttonView addTarget:self action:@selector(viewClick) forControlEvents:UIControlEventTouchUpInside];
        buttonView;
    })];
}

#pragma mark - 唤醒其他App
- (void)viewClick {
    NSURL *urlScheme = [NSURL URLWithString:@"testScheme://"];
    BOOL canOpenURL = [[UIApplication sharedApplication] canOpenURL:urlScheme];
    
    if (canOpenURL) {
        [[UIApplication sharedApplication] openURL:urlScheme options:nil completionHandler:^(BOOL success) {
            NSLog(@"");
        }];
    }else {
        NSLog(@"App不存在。");
    }
}

@end
