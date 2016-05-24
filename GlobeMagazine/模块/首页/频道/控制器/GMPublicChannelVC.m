//
//  GMPublicChannelVC.m
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import "GMPublicChannelVC.h"
#import "GMOrdinaryChannelCell.h"
#import "GMChannelHttpRequestManager.h"
#import "GMColumnItemModel.h"
#import "HXWCoreDataManager.h"

@interface GMPublicChannelVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *aTableView;
@property (assign, nonatomic) BOOL isFirstRefresh;
@property (strong, nonatomic) NSMutableArray *sourceArray;
@property (strong, nonatomic) NSString *channelName;
@end

@implementation GMPublicChannelVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    DLog(@"%@",self.channelID);

    if (self.isFirstRefresh == NO) {
        self.isFirstRefresh = YES;
        NSLog(@"需要刷新");
//        [self refreshData];
    }else{
        NSLog(@"不需要刷新");
        
    }
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
}
- (void)dealloc
{
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andChannelName:(NSString *)channelName
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.channelName = channelName;
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        /*
         *  首次是否刷新
         */
        self.isFirstRefresh = NO;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(所有背景视图的默认颜色);
    
    _aTableView.dk_backgroundColorPicker = DKColorPickerWithKey(所有背景视图的默认颜色);
    
    _aTableView.separatorStyle = UITableViewCellSelectionStyleNone;

    [self loadDataFromCoreData];
}
- (void)loadDataFromCoreData
{
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(globalQueue, ^{
    
        NSManagedObjectContext *context = [[HXWCoreDataEventManager sharedInstance] managedObjectContext];
        
        [context performBlockAndWait:^{

            [self.sourceArray  addObjectsFromArray:  [[[[HXWCoreDataEventManager sharedInstance] selectAttributeForEntity:@"GMColumnItemModel" attributeName:@"channel_Name" value:self.channelName sortByAttributeName:@"chapt_id"] reverseObjectEnumerator] allObjects]];
            
        }];
        
        dispatch_async(mainQueue, ^{
            
            [_aTableView reloadData];
        });
    });

}

- (void)refreshData
{
    
    
    __weak typeof(self) weakSelf = self;
    
    [GMChannelHttpRequestManager getWithURLString:[NSString stringWithFormat:@"%@%@",@"http://www.cbnweek.com/v/lanmu_api?id=",self.channelID] parameters:nil success:^(id responseObject) {
        
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        if ([[result objectForKey:@"result"] integerValue] == 1) {
            [weakSelf refreshEndWithResult:result];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);

    }];
}

- (void)refreshEndWithResult:(NSDictionary *)result
{
    [[HXWCoreDataEventManager sharedInstance] deleteWithEntity:@"GMColumnItemModel" attributeName:@"channel_Name" value:self.channelName];
    [_sourceArray removeAllObjects];

    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(globalQueue, ^{
        
        for (NSMutableDictionary *tempDic in [result objectForKey:@"article_list"]) {
            
            NSMutableDictionary *dic =[[NSMutableDictionary alloc] initWithDictionary:tempDic];
            
            [dic setObject:self.title forKey:@"channel_Name"];
            
            GMColumnItemModel *model = [GMColumnItemModel createNSManagedObjectForName:@"GMColumnItemModel"];
            
            model.channel_Name = [NSString stringWithFormat:@"%@",[dic objectForKey:@"channel_Name"]];
            model.chapt_brief = [NSString stringWithFormat:@"%@",[dic objectForKey:@"chapt_brief"]];
            model.chapt_id = [NSString stringWithFormat:@"%@",[dic objectForKey:@"chapt_id"]];
            model.chapt_time = [NSString stringWithFormat:@"%@",[dic objectForKey:@"chapt_time"]];
            model.chapt_title = [NSString stringWithFormat:@"%@",[dic objectForKey:@"chapt_title"]];
            model.click_count = [NSString stringWithFormat:@"%@",[dic objectForKey:@"click_count"]];
            model.comm_count = [NSString stringWithFormat:@"%@",[dic objectForKey:@"comm_count"]];
            model.if_pic = [NSString stringWithFormat:@"%@",[dic objectForKey:@"if_pic"]];
            model.image = [NSString stringWithFormat:@"%@",[dic objectForKey:@"image"]];
            model.issue_id = [NSString stringWithFormat:@"%@",[dic objectForKey:@"issue_id"]];
            model.lanmu_name = [NSString stringWithFormat:@"%@",[dic objectForKey:@"lanmu_name"]];
            model.mini_image = [NSString stringWithFormat:@"%@",[dic objectForKey:@"mini_image"]];
            
            [[HXWCoreDataEventManager sharedInstance] saveContext];
            
            
        }

        
        dispatch_async(mainQueue, ^{
            
            [_aTableView reloadData];
        });
    });

    


}


#pragma mark UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sourceArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifierStr = @"GMOrdinaryChannelCell";
    GMColumnItemModel *tempModel = [_sourceArray objectAtIndex:indexPath.row];
    
    
    GMOrdinaryChannelCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierStr];
    
    if (cell == nil) {
        
        cell = [[GMOrdinaryChannelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierStr];
        
    }
    cell.columModel = tempModel;
        
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86*screen_Width/320;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GMChaptInfomationVC *chaptInfomationVC = [[GMChaptInfomationVC alloc] initWithNibName:@"GMChaptInfomationVC" bundle:nil];
    
    [self.navigationController pushViewController:chaptInfomationVC animated:YES];
    
    NSLog(@"点击");
}
#define mark 控件的创建
- (NSMutableArray *)sourceArray
{
    if (!_sourceArray) {
        
        self.sourceArray = [[NSMutableArray alloc] init];
        
    }
    return _sourceArray;
}

@end
