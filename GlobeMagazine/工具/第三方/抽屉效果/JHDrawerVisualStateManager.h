//
//  JHDrawerVisualStateManager.h
//  GlobeMagazine
//
//  Created by 滑现伟 on 16/5/23.
//  Copyright © 2016年 Demon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMDrawerVisualState.h"
typedef NS_ENUM(NSInteger, MMDrawerAnimationType){
    MMDrawerAnimationTypeNone,
    MMDrawerAnimationTypeSlide,
    MMDrawerAnimationTypeSlideAndScale,
    MMDrawerAnimationTypeSwingingDoor,
    MMDrawerAnimationTypeParallax,
};

@interface JHDrawerVisualStateManager : NSObject
@property (nonatomic,assign) MMDrawerAnimationType leftDrawerAnimationType;
@property (nonatomic,assign) MMDrawerAnimationType rightDrawerAnimationType;

+ (JHDrawerVisualStateManager *)sharedManager;

-(MMDrawerControllerDrawerVisualStateBlock)drawerVisualStateBlockForDrawerSide:(MMDrawerSide)drawerSide;

@end
