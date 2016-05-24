//
//  GMRecommendBlockView.m
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import "GMRecommendBlockView.h"
#import "JHImageView.h"

#define clearance 8

#define item_Width (self.frame.size.width - clearance *3)/2

#define item_Height (self.frame.size.height - clearance * 3)/2
@implementation GMRecommendBlockView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dk_backgroundColorPicker = DKColorPickerWithKey(所有背景视图的默认颜色);
        
        [self addBlockItemViews];
        
        UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
        
        lineImageView.dk_backgroundColorPicker = DKColorPickerWithKey(Cell分割线的默认颜色);
        
        [self addSubview:lineImageView];
    }
    return self;
}

- (void)addBlockItemViews
{
    
    CGFloat width = clearance;
    
    CGFloat height = clearance;
    
    
    for (int i = 0; i < 2; i++) {
        
        for (int j = 0; j < 2; j++) {
            
            JHImageView *blockItemImageView = [[JHImageView alloc] initWithFrame:CGRectMake(width, height, item_Width, item_Height)];
            
            blockItemImageView.image = [UIImage imageNamed:@"defaultImage.jpg"];
            
            [self addSubview:blockItemImageView];
            
            width = blockItemImageView.frame.size.width + blockItemImageView.frame.origin.x + width  ;
            
            
        }
        width = clearance;
        
        height = height +item_Height + clearance;
        
        
    }
    
}


@end
