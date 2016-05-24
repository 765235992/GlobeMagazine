//
//  JHLabel.m
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import "JHLabel.h"

@implementation JHLabel
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.numberOfLines = 0;
        
        self.dk_textColorPicker = DKColorPickerWithKey(所有字体默认颜色);
        
        
    }
    return self;
}
- (void)setContent:(NSString *)content
{
    if (content == nil || content.length<= 0) {
        
        return;
    }
    _content = content;
    
    
    NSMutableDictionary *attributeDic = [[NSMutableDictionary alloc] init];
    
    /*
     *  段落样式
     */
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.alignment = NSTextAlignmentJustified;
    
    [paraStyle setLineSpacing:7];
    
    [attributeDic setObject:paraStyle forKey:NSParagraphStyleAttributeName];
    
    /*
     *  字体 大小
     */
    [attributeDic setObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
    
    self.attributedText = [[NSAttributedString alloc] initWithString:_content attributes: attributeDic];
    
    
}

@end
