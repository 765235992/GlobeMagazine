//
//  GMOrdinaryChannelCell.m
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import "GMOrdinaryChannelCell.h"

@interface GMOrdinaryChannelCell ()


@end

@implementation GMOrdinaryChannelCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, screen_Width, 86*screen_Width/320);
        self.dk_backgroundColorPicker = DKColorPickerWithKey(所有背景视图的默认颜色);
        [self addSubview:self.newsLineImageView];
        [self addSubview:self.newsThumbImageView];
        [self addSubview:self.newsTitleLabel];
    }
    
    return self;
}

- (JHImageView *)newsThumbImageView
{
    if (!_newsThumbImageView) {
        
        self.newsThumbImageView = [[JHImageView alloc] initWithFrame:CGRectMake(8, 8, 86*screen_Width/320, self.frame.size.height - 17)];
        
    }
    return _newsThumbImageView;
}
- (UIImageView *)newsLineImageView
{
    if (!_newsLineImageView) {
        
        self.newsLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-2, screen_Width, 1)];
        
        _newsLineImageView.dk_backgroundColorPicker = DKColorPickerWithKey(Cell分割线的默认颜色);
    }
    
    return _newsLineImageView;
}
- (JHLabel *)newsTitleLabel
{
    if (!_newsTitleLabel) {
        
        _newsTitleLabel = [[JHLabel alloc] initWithFrame:CGRectMake(86*screen_Width/320 +14, 8, screen_Width - 86*screen_Width/320 - 21, 20)];
        _newsTitleLabel.numberOfLines = 0;
        
    }
    return _newsTitleLabel;
}
- (void)setContent:(NSString *)content
{
    _newsTitleLabel.content = content;
    _newsTitleLabel.font = [UIFont systemFontOfSize:fontSize(17,16,15)];

    [_newsTitleLabel sizeToFit];
    
    _newsThumbImageView.image = [UIImage imageNamed:@"defaultImage.jpg"];
    
}
- (void)setColumModel:(GMColumnItemModel *)columModel
{
    _newsTitleLabel.text = columModel.chapt_title;
    _newsTitleLabel.font = [UIFont systemFontOfSize:fontSize(17,16,15)];
    _newsTitleLabel.backgroundColor = [UIColor clearColor];
    
//    [_newsTitleLabel sizeToFit];
    [_newsThumbImageView sd_setImageWithURL:[NSURL URLWithString:columModel.mini_image] placeholderImage:[UIImage imageNamed:@"defaultImage.jpg"]];
    
//    _newsThumbImageView
}




@end
