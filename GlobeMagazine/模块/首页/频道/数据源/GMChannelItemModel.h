//
//  GMChannelItemModel.h
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/24.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface GMChannelItemModel : NSManagedObject
@property (nonatomic ,strong) NSString *category_name;
@property (nonatomic ,strong) NSString *channel_Name;
@property (nonatomic ,strong) NSString *chapt_id;
@property (nonatomic ,strong) NSString *chapt_title;
@property (nonatomic ,strong) NSString *click_count;
@property (nonatomic ,strong) NSString *column_id;
@property (nonatomic ,strong) NSString *cover_img_big;
@property (nonatomic ,strong) NSString *cover_img_bigc;
@property (nonatomic ,strong) NSString *cover_img_bmini2;
@property (nonatomic ,strong) NSString *cover_img_mini;
@property (nonatomic ,strong) NSString *cover_img_smini;
@property (nonatomic ,strong) NSString *hasAuth;
@property (nonatomic ,strong) NSString *is_ad;
@property (nonatomic ,strong) NSString *issue_id;

@end
