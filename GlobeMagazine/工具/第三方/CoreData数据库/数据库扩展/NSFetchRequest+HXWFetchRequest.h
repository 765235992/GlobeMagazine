//
//  NSFetchRequest+HXWFetchRequest.h
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//


#import <Foundation/Foundation.h>
@import CoreData;

@interface NSFetchRequest (HXWFetchRequest)

/*
 *  基本使用
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName;
/*
 *  某一类排序
 */
+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortDescriptorName:(NSString *)sortDescriptorName;
/*
 *  某一类分页查找
 *  offset 偏移位置
 *  limit 取出的量

 */
+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortByAttributeName:(NSString *)sortDescriptorName Offset:(NSInteger)offset Limit:(NSInteger)limit;

/*
 *  基本使用，按条件查找
 *
 *  + 偏移使用
 */
/*
 *  一般的按条件查找
 */
+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName Predicate:(NSPredicate *)predicate;
/*
 *  一般的按条件查找
 *  offset 偏移位置
 *  按条件查找，并取出一定的偏移
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName Predicate:(NSPredicate *)predicate Offset:(NSInteger)offset;
/*
 *  一般的按条件查找
 *  limit 取出的量
 *  按条件查找，并取出一定的量
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName Predicate:(NSPredicate *)predicate Limit:(NSInteger)limit;
/*
 *  一般的按条件查找
 *  limit 取出的量
 *  offset 偏移位置
 *  按条件查找，并取出一定偏移下的量
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName Predicate:(NSPredicate *)predicate Offset:(NSInteger)offset Limit:(NSInteger)limit;

/*
 *  基本使用  +   偏移使用  +  排序
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortByAttributeName:(NSString *)sortDescriptorName Predicate:(NSPredicate *)predicate;

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortByAttributeName:(NSString *)sortDescriptorName Predicate:(NSPredicate *)predicate Offset:(NSInteger)offset;

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortByAttributeName:(NSString *)sortDescriptorName Predicate:(NSPredicate *)predicate Limit:(NSInteger)limit;

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortByAttributeName:(NSString *)sortDescriptorName Predicate:(NSPredicate *)predicate Offset:(NSInteger)offset Limit:(NSInteger)limit;


/*
 *  删除
 */

+ (NSFetchRequest *)fetchRequestDeleteWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName;

@end
