//
//  NSManagedObject+HXWManagedObject.h
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>
@import CoreData;

@interface NSManagedObject (HXWManagedObject)

/*
 *  创建一个对象
 *
 *  因为是封装 具体对象具体使用，所以创建的插入在对象分类中进行
 */
+ (id)createNSManagedObjectForName:(NSString *)name;

/*
 *  删除一个对象
 */
+ (void)deleteNSManagedObject:(id)object;

@end
