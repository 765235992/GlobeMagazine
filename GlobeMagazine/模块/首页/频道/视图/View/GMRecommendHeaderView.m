//
//  GMRecommendHeaderView.m
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import "GMRecommendHeaderView.h"

@implementation GMRecommendHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.sliderView];
        
        [self addSubview:self.blockView];
        
    }
    return self;
}

- (GMRecommendSliderView *)sliderView
{
    if (!_sliderView) {
        
        self.sliderView = [[GMRecommendSliderView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*0.55)];
        _sliderView.backgroundColor = [UIColor redColor];
//        _sliderView.dk_backgroundColorPicker = DKColorPickerWithKey(所有背景视图的默认颜色);
        
    }
    return _sliderView;
}

- (GMRecommendBlockView *)blockView
{
    if (!_blockView) {
        
        self.blockView = [[GMRecommendBlockView alloc] initWithFrame:CGRectMake(0, self.frame.size.height*0.55, self.frame.size.width, self.frame.size.height*0.45)];
        
    }
    return _blockView;
}

@end
