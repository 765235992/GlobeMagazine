//
//  GMRecommendChannelVC.m
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import "GMRecommendChannelVC.h"
#import "GMOrdinaryChannelCell.h"
#import "GMRecommendHeaderView.h"
static const CGFloat MJDuration = 5.0;

@interface GMRecommendChannelVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *aTableView;
@property (strong, nonatomic) GMRecommendHeaderView *recommendHeaderView;
@property (assign, nonatomic) BOOL isFirstRefresh;
@end

@implementation GMRecommendChannelVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    DLog(@"%@",self.navigationController);
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
}
- (void)dealloc
{
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
    

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(所有背景视图的默认颜色);
    _aTableView.dk_backgroundColorPicker = DKColorPickerWithKey(所有背景视图的默认颜色);
    _aTableView.separatorStyle = UITableViewCellSelectionStyleNone;

    _aTableView.tableHeaderView = self.recommendHeaderView;
    /*
     *  首次是否刷新
     */
    self.isFirstRefresh = NO;
    if (self.isFirstRefresh == NO) {
        
        self.isFirstRefresh = YES;
        
        NSLog(@"需要刷新");
        _aTableView.mj_header = [JHRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
        
        // 马上进入刷新状态
        [_aTableView.mj_header beginRefreshing];
    }else{
        
        NSLog(@"不需要刷新");
        
    }
    
  
}
- (void)loadDataFromCoradata
{
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [_aTableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [_aTableView.mj_header endRefreshing];
    });

}
- (void)refreshData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [_aTableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [_aTableView.mj_header endRefreshing];
    });
}


- (GMRecommendHeaderView *)recommendHeaderView
{
    if (!_recommendHeaderView) {
        
        self.recommendHeaderView = [[GMRecommendHeaderView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 320*screen_Width/320)];
        
        _recommendHeaderView.backgroundColor = [UIColor orangeColor];
    }
    return _recommendHeaderView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifierStr = @"GMOrdinaryChannelCell";
    
    
    GMOrdinaryChannelCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierStr];
    
    if (cell == nil) {
        
        cell = [[GMOrdinaryChannelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierStr];
        
    }
    
    cell.content = [NSString stringWithFormat:@"%@-- %@",@"因为兼容性问题，色阶板功能只能在IE浏览器中运行",self.title];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86*screen_Width/320;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"%@",self.navigationController);

}

@end
