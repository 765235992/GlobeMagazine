//
//  GMRecommendSliderView.m
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import "GMRecommendSliderView.h"
#import "LJHBaseShufflingView.h"

@interface GMRecommendSliderView ()

@property (nonatomic, strong) LJHBaseShufflingView *shufflingView;

@end

@implementation GMRecommendSliderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.shufflingView];
        
    }
    return self;
}

- (LJHBaseShufflingView *)shufflingView
{
    if (!_shufflingView) {
        
        self.shufflingView = [[LJHBaseShufflingView alloc] initWithFrame:self.bounds andDefaultImage:[UIImage imageNamed:@"1111.jpg"]];
        
        _shufflingView.AutoScrollDelay = 5.0f;
        
        _shufflingView.style = PageControlAtCenter;
        __weak typeof(self) weakSelf = self;
        
        NSMutableArray *arr1 = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 5; i++) {
            
            LJHShufflingModel *itemModel = [[LJHShufflingModel alloc] init];
            
         
            itemModel.newsThumbStr =@"sada";
            itemModel.newsTitleStr = @"aaaaaaaaaaa";
            itemModel.newsDefaultImage = [UIImage imageNamed:@"defaultImage.jpg"];
            itemModel.index = i;
            
            [arr1 addObject:itemModel];
            
        }

        _shufflingView.sourceModelArray = arr1;
        
        
        
        [_shufflingView setImageViewDidTapAtIndex:^(LJHShufflingModel *shufflingModel) {
            
            NSLog(@" %ld  ",(long)shufflingModel.index);
           
        }];

    }
    return _shufflingView;
}
- (void)sa {
//    self.picView = [[LJHBaseShufflingView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_WIDTH * 403.0 / 320.0 - (SCREEN_WIDTH-16*3)/2.0*65.0/136.0*2.0 - 2*20.0) andDefaultImage:IMAGE_WITH_NAME(@"top_bg")];
//    self.picView.backgroundColor = [UIColor redColor];
//    
//    self.picView.AutoScrollDelay = 5.0f;
//    
//    __weak typeof(self) weakSelf = self;
//    
//    [self.headerView.topImageView addSubview:self.picView];
//    _picView.backgroundColor = [UIColor redColor];
//    _picView.style = PageControlAtCenter;
//    
//    //    [self.view addSubview:_picView];
//    
//    self.picView.backgroundColor = [UIColor whiteColor];
//    
//    self.picView.style = PageControlAtCenter;
//    
//    NSMutableArray *arr1 = [NSMutableArray array];
//    NSLog(@"arr-->%@",arr1);
//    
//    for (NSInteger i = 0; i < self.slides.count; i++) {
//        
//        LJHShufflingModel *itemModel = [[LJHShufflingModel alloc] init];
//        
//        
//        //            itemModel.newsDefaultImage = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(i+1)]];
//        catalogOneModel *tempModel = [self.slides objectAtIndex:i];
//        itemModel.newsThumbStr = tempModel.chapt_pic_url;
//        itemModel.newsTitleStr = tempModel.chapt_title;
//        
//        itemModel.index = i;
//        
//        [arr1 addObject:itemModel];
//        
//    }
//    self.picView.sourceModelArray = arr1;
//    
//    NSLog(@"arr-->%@",arr1);
//    
//    
//    [self.picView setImageViewDidTapAtIndex:^(LJHShufflingModel *shufflingModel) {
//        
//        NSLog(@" %ld  ",(long)shufflingModel.index);
//        if (self.slides.count !=0) {
//            [weakSelf picClicked:[weakSelf.slides objectAtIndex:shufflingModel.index]];
//            
//        }
//    }];
}

@end
