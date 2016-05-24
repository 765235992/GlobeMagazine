//
//  NSManagedObjectModel+HXWManagedObjectModel.h
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>
@import CoreData;

@interface NSManagedObjectModel (HXWManagedObjectModel)
+ (NSURL *)URLForManagedObjectModelName:(NSString *)modelName;

@end
