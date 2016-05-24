//
//  GMColumnItemModel.h
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/24.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface GMColumnItemModel : NSManagedObject
@property (nonatomic ,strong) NSString *channel_Name;
@property (nonatomic ,strong) NSString *chapt_brief;
@property (nonatomic ,strong) NSString *chapt_id;
@property (nonatomic ,strong) NSString *chapt_time;
@property (nonatomic ,strong) NSString *chapt_title;
@property (nonatomic ,strong) NSString *click_count;
@property (nonatomic ,strong) NSString *comm_count;
@property (nonatomic ,strong) NSString *if_pic;
@property (nonatomic ,strong) NSString *image;
@property (nonatomic ,strong) NSString *issue_id;
@property (nonatomic ,strong) NSString *lanmu_name;
@property (nonatomic ,strong) NSString *mini_image;


@end
