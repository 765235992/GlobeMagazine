//
//  GMPublicChannelVC.h
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMPublicChannelVC : UIViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andChannelName:(NSString *)channelName;
@property (nonatomic, strong) NSString *channelID;
@end
