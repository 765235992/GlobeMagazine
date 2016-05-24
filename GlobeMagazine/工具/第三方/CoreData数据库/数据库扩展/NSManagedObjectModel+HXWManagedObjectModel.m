//
//  NSManagedObjectModel+HXWManagedObjectModel.m
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import "NSManagedObjectModel+HXWManagedObjectModel.h"

@implementation NSManagedObjectModel (HXWManagedObjectModel)
+ (NSURL *)URLForManagedObjectModelName:(NSString *)modelName {
    
    NSLog(@"%@",modelName);
    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:modelName withExtension:@"momd"];
    NSLog(@"%@",modelUrl);
    return modelUrl;
}
@end
