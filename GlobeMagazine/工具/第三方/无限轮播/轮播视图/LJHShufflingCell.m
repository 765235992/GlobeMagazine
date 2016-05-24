//
//  LJHShufflingCell.m
//  ShufflingBaseDemo
//
//  Created by yicaiwang on 16/2/25.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "LJHShufflingCell.h"
//#import "LJHShufflingImageRequestHelper.h"
#import "UIImageView+WebCache.h"

#define pageControlHeight 20
#define myWidth self.frame.size.width
#define myHeight self.frame.size.height
#define pageSize (myHeight * 0.2 > 25 ? 25 : myHeight * 0.2)

@interface LJHShufflingCell ()

//@property (nonatomic, strong) LJHShufflingImageRequestHelper *requestHelper;

@property (nonatomic, strong) UIImageView *maskImageView;

@end

@implementation LJHShufflingCell

- (id)initWithFrame:(CGRect)frame andDefaultImage:(UIImage *)defaultImage
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.maskImageView];
        
        /*
         *  默认背景图片
         */
        self.image = defaultImage;
        
        self.contentMode = UIViewContentModeScaleAspectFill;
        
        self.clipsToBounds = YES;
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.newsTitleLabel];
        
    }
    
    return self;
}



- (UIImageView *)maskImageView
{
    if (!_maskImageView) {
        
        self.maskImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        _maskImageView.image = [UIImage imageNamed:@"home_cell_mb.png"];
    }
    
    return _maskImageView;
}

- (JHLabel *)newsTitleLabel
{
    
    if (!_newsTitleLabel) {
        
        self.newsTitleLabel = [[JHLabel alloc] initWithFrame:CGRectMake(0, myHeight-pageControlHeight , myWidth, 4)];
        
        _newsTitleLabel.textAlignment = 1;
        
        _newsTitleLabel.textColor = [UIColor whiteColor];
        
    }
    
    return _newsTitleLabel;
    
}

- (void)setShufflingModel:(LJHShufflingModel *)shufflingModel
{

    _newsTitleLabel.text = shufflingModel.newsTitleStr;
    
    [_newsTitleLabel sizeToFit];
    
    _newsTitleLabel.frame = CGRectMake(10, myHeight-pageControlHeight - _newsTitleLabel.frame.size.height, myWidth - 20, _newsTitleLabel.frame.size.height);
    
    [self sd_setImageWithURL:[NSURL URLWithString:shufflingModel.newsThumbStr] placeholderImage:shufflingModel.newsDefaultImage];
    

}
@end
