//
//  JHImageView.m
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import "JHImageView.h"

@implementation JHImageView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.nightMaskImageView];
        
        self.backgroundColor = [UIColor yellowColor];
        
    }
    return self;
}
- (UIImageView *)nightMaskImageView
{
    if (!_nightMaskImageView) {
        
        self.nightMaskImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        _nightMaskImageView.dk_backgroundColorPicker = image_Back_Mask;
        
    }
    return _nightMaskImageView;
}
- (void)setNeedsDisplay
{
    _nightMaskImageView.frame = self.bounds;
}

@end
