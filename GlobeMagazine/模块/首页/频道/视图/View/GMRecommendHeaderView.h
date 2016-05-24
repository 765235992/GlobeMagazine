//
//  GMRecommendHeaderView.h
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMRecommendBlockView.h"
#import "GMRecommendSliderView.h"

@interface GMRecommendHeaderView : UIView

@property (nonatomic, strong) GMRecommendSliderView *sliderView;

@property (nonatomic, strong) GMRecommendBlockView *blockView;
@end
