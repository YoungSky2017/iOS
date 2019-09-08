//
//  ViewController.m
//  SampleApp
//
//  Created by 杨奇 on 2019/5/17.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"

#import "GTDeleteCellView.h"
#import "GTListLoader.h"
#import "GTListItem.h"
#import "GTMediator.h"

#import "GTSearchBar.h"
#warning 可能存在重复引用，因为GTSearchBar.m中已经引用了
#import "GTScreen.h"

@interface GTNewsViewController () <UITableViewDataSource, UITableViewDelegate, GTNormalTableViewCellDelegate>

@property (nonatomic, strong, readwrite)UITableView *tableView;
@property (nonatomic, strong, readwrite)NSArray *dataArray;
@property (nonatomic, strong, readwrite)GTListLoader *listLoader;

@end


@implementation GTNewsViewController
- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"page_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    self.listLoader = [[GTListLoader alloc] init];
    __weak typeof(self) wself = self;

    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof(wself)strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
    //寻找数据不加载的情况
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController.navigationItem setTitleView:({
        GTSearchBar *searchBar = [[GTSearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - UI(20), self.navigationController.navigationBar.bounds.size.height)];
        searchBar;
        
        //拉起键盘和输入框
        //        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - UI(20), self.navigationController.navigationBar.bounds.size.height)];
        //        button.backgroundColor = [UIColor lightGrayColor];
        //        [button addTarget:self action:@selector(_showCommentView) forControlEvents:UIControlEventTouchUpInside];
        //        button;
    })];
}

#pragma mark - UItableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    
    //组件化三种方案讲解
    
    //    __kindof UIViewController *detailController = [GTMediator detailViewControllerWithUrl:item.articleUrl];
    //    detailController.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    //    [self.navigationController pushViewController:detailController animated:YES];
    
    [GTMediator openUrl:@"detail://" params:@{@"url":item.articleUrl,@"controller":self.navigationController}];
    
//    Class cls = [GTMediator classForProtocol:@protocol(GTDetailViewControllerProtocol)];
//    [self.navigationController pushViewController:[[cls alloc] detailViewControllerWithUrl:item.articleUrl] animated:YES];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniqueKey];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }

    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    
//    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
//    
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
//    
//    __weak typeof(self) wself = self;
//    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
//        __strong typeof(self)strongSelf = wself;
//        [strongSelf.dataArray removeLastObject];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
}

@end
