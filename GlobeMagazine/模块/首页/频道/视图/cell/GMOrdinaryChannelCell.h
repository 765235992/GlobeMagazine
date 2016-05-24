//
//  GMOrdinaryChannelCell.h
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHImageView.h"
#import "JHLabel.h"
#import "GMColumnItemModel.h"
@interface GMOrdinaryChannelCell : UITableViewCell
@property (strong, nonatomic) JHLabel *newsTitleLabel;
@property (strong, nonatomic) JHImageView *newsThumbImageView;
@property (strong, nonatomic) UIImageView *newsLineImageView;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) GMColumnItemModel *columModel;
@end
