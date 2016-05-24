//
//  LJHShufflingCell.h
//  ShufflingBaseDemo
//
//  Created by yicaiwang on 16/2/25.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJHShufflingModel.h"
#import "JHImageView.h"
#import "JHLabel.h"
@interface LJHShufflingCell : JHImageView
@property (nonatomic, strong) JHLabel *newsTitleLabel;

@property (nonatomic, strong) LJHShufflingModel *shufflingModel;

- (id)initWithFrame:(CGRect)frame andDefaultImage:(UIImage *)defaultImage;

@end
