//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by 杨奇 on 2019/5/26.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>
#import "GTScreen.h"
#import "GTMediator.h"

@interface GTDetailViewController ()<WKNavigationDelegate>

@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong, readwrite) UIProgressView *progressView;
@property (nonatomic, copy, readwrite) NSString *articleUrl;

@end

@implementation GTDetailViewController

+ (void)load {
    [GTMediator registerScheme:@"detail://" processBlock:^(NSDictionary * _Nonnull params) {
        NSString *url = (NSString *)[params objectForKey:@"url"];
        UINavigationController *navigationController = (UINavigationController *)[params objectForKey:@"controller"];
        GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlString:url];
        //        controller.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
        [navigationController pushViewController:controller animated:YES];
    }];
    
    [GTMediator registerProtol:@protocol(GTDetailViewControllerProtocol) class:[self class]];
}

- (void) dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
//    [super dealloc];
//    ARC下不需要 [super dealloc]
}

- (instancetype)initWithUrlString:(NSString *)urlString {
    self = [super init];
    if (self) {
        self.articleUrl = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, STATUSBARHEIGHT + 44, self.view.frame.size.width, self.view.frame.size.height - STATUSBARHEIGHT - 44)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    [self.webView addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        self.progressView;
    })];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl ]]];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* @abstract Decides whether to allow or cancel a navigation. */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

/* @abstract Invoked when a main frame navigation completes. */
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    self.progressView.progress = self.webView.estimatedProgress;
}

@end
