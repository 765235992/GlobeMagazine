//
//  GMChannelRootVC.m
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import "GMChannelRootVC.h"
#import "MMDrawerBarButtonItem.h"
#import "JHScrollPageView.h"
#import "JHSegmentStyle.h"
#import "GMRecommendChannelVC.h"
#import "GMPublicChannelVC.h"

@interface GMChannelRootVC ()
{
    JHScrollPageView *scrollPageView;
    BOOL isNight;
}
@property (nonatomic, strong) NSMutableArray *currentArr;
@end

@implementation GMChannelRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isNight = NO;
    
    [self setupRightMenuButton];
    self.view.dk_backgroundColorPicker =DKColorPickerWithRGB(0x003d79, 0xff8040, 111111);

    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupChannel];
    
}



-(void)setupRightMenuButton{
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}
-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (void)setupChannel
{
    JHSegmentStyle *style = [[JHSegmentStyle alloc] init];
    
    style.showLine = YES;

    // 显示附加的按钮
    style.showExtraButton = YES;
    
    // 设置附加按钮的背景图片
    style.extraBtnBackgroundImageName = @"extraBtnBackgroundImage";
    
//    style.segmentHeight =44;
    // 设置子控制器 --- 注意子控制器需要设置title, 将用于对应的tag显示title
    NSArray *childVcs = [NSArray arrayWithArray:[self setupChildVcAndTitle]];
    
    self.currentArr = [[NSMutableArray alloc] initWithArray:childVcs];
    
    // 初始化
    scrollPageView = [[JHScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, screen_Width, screen_Height -64) segmentStyle:style childVcs:childVcs parentViewController:self];
    
    scrollPageView.backgroundColor = [UIColor blueColor];
    
    // 额外的按钮响应的block
    __weak typeof(self) weakSelf = self;
    
    scrollPageView.extraBtnOnClick = ^(UIButton *extraBtn){
        DLog(@"点击了extraBtn");
        if (isNight == NO) {
            [weakSelf night];
        }else{
            [weakSelf day];
        }
        
    };
    
    scrollPageView.currentTitleInfo = ^(UILabel *label, NSInteger index){
        
        weakSelf.navigationItem.title = label.text;
        
    };
    
    
    [self.view addSubview:scrollPageView];
    
}
- (void)day{
    isNight = NO;
    [self.dk_manager dawnComing];


}
- (void)night{
    [self.dk_manager nightFalling];

    isNight = YES;
}
- (NSArray *)setupChildVcAndTitle {
    
    GMRecommendChannelVC *recommendVC = [[GMRecommendChannelVC alloc] initWithNibName:nil bundle:nil];
//    GMRecommendChannelVC *recommendVC = [[GMRecommendChannelVC alloc]init];;

    recommendVC.title = @"推荐";
    
    GMPublicChannelVC *vc2 = [[GMPublicChannelVC alloc] initWithNibName:@"GMPublicChannelVC" bundle:nil andChannelName:@"商业头条"];
    vc2.view.backgroundColor = [UIColor greenColor];
    vc2.title = @"商业头条";
    vc2.channelID = @"13";
    
    GMPublicChannelVC *vc3 = [[GMPublicChannelVC alloc] initWithNibName:@"GMPublicChannelVC" bundle:nil andChannelName:@"热点事件"];
    vc3.view.backgroundColor = [UIColor yellowColor];
    vc3.title = @"热点事件";
    vc3.channelID = @"12";
    
    GMPublicChannelVC *vc4 = [[GMPublicChannelVC alloc] initWithNibName:@"GMPublicChannelVC" bundle:nil andChannelName:@"新一线"];
    vc4.view.backgroundColor = [UIColor brownColor];
    vc4.title = @"新一线";
    vc4.channelID = @"11";
    
    GMPublicChannelVC *vc5 = [[GMPublicChannelVC alloc] initWithNibName:@"GMPublicChannelVC" bundle:nil andChannelName:@"周围Surrounding"];
    vc5.view.backgroundColor = [UIColor lightGrayColor];
    vc5.title = @"周围Surrounding";
    vc5.channelID = @"10";
    
    GMPublicChannelVC *vc6 = [[GMPublicChannelVC alloc] initWithNibName:@"GMPublicChannelVC" bundle:nil andChannelName:@"金字招牌"];
    vc6.view.backgroundColor = [UIColor orangeColor];
    vc6.title = @"金字招牌";
    vc6.channelID = @"9";
    
    GMPublicChannelVC *vc7 = [[GMPublicChannelVC alloc] initWithNibName:@"GMPublicChannelVC" bundle:nil andChannelName:@"Points观点"];
    vc7.view.backgroundColor = [UIColor cyanColor];
    vc7.title = @"Points观点";
    vc7.channelID = @"8";
    
    GMPublicChannelVC *vc8 = [[GMPublicChannelVC alloc] initWithNibName:@"GMPublicChannelVC" bundle:nil andChannelName:@"Business+"];
    vc8.view.backgroundColor = [UIColor blueColor];
    vc8.title = @"Business+";
    vc8.channelID = @"7";
    
    GMPublicChannelVC *vc9 = [[GMPublicChannelVC alloc] initWithNibName:@"GMPublicChannelVC" bundle:nil andChannelName:@"封面故事"];
    vc9.view.backgroundColor = [UIColor purpleColor];
    vc9.title = @"封面故事";
    vc9.channelID = @"6";
    
    GMPublicChannelVC *vc10 = [[GMPublicChannelVC alloc] initWithNibName:@"GMPublicChannelVC" bundle:nil andChannelName:@"大公司"];
    vc10.view.backgroundColor = [UIColor magentaColor];
    vc10.title = @"大公司";
    vc10.channelID = @"5";
    
    GMPublicChannelVC *vc11 = [[GMPublicChannelVC alloc] initWithNibName:@"GMPublicChannelVC" bundle:nil andChannelName:@"快公司"];
    vc11.view.backgroundColor = [UIColor whiteColor];
    vc11.title = @"快公司";
    vc11.channelID = @"4";
    
    GMPublicChannelVC *vc12 = [[GMPublicChannelVC alloc] initWithNibName:@"GMPublicChannelVC" bundle:nil andChannelName:@"炫公司"];
    vc12.view.backgroundColor = [UIColor redColor];
    vc12.title = @"炫公司";
    vc12.channelID = @"3";
    
    NSArray *childVcs = [NSArray arrayWithObjects:recommendVC, vc2, vc3, vc4, vc5, vc6, vc7, vc8, vc9 , vc10, vc11, vc12, nil];
    
    return childVcs;
}

@end
