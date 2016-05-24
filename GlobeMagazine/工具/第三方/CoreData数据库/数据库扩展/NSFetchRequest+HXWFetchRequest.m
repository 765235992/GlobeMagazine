//
//  NSFetchRequest+HXWFetchRequest.m
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import "NSFetchRequest+HXWFetchRequest.h"

@implementation NSFetchRequest (HXWFetchRequest)
/*
 *  基本使用
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName {
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:contect];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setReturnsObjectsAsFaults:NO];
    
    return fetchRequest;
}
/*
 *  某一类排序
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortDescriptorName:(NSString *)sortDescriptorName {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:contect EntityName:entityName];
    if (sortDescriptorName && ![sortDescriptorName isEqualToString:@""]) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortDescriptorName ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [fetchRequest setSortDescriptors:sortDescriptors];
    }
    return fetchRequest;
}
/*
 *  某一类分页查找
 *  offset 偏移位置
 *  limit 取出的量
 
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortByAttributeName:(NSString *)sortDescriptorName Offset:(NSInteger)offset Limit:(NSInteger)limit {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:contect EntityName:entityName SortDescriptorName:sortDescriptorName];
    if (offset > 0) {
        [fetchRequest setFetchOffset:offset];
    }
    if (limit > 0) {
        [fetchRequest setFetchLimit:limit];
    }
    return fetchRequest;
}

/*
 *  基本使用
 *
 *  + 偏移使用
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName Predicate:(NSPredicate *)predicate {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:contect EntityName:entityName];
    [fetchRequest setPredicate:predicate];
    return fetchRequest;
}
/*
 *  一般的按条件查找
 *  offset 偏移位置
 *  按条件查找，并取出一定的偏移
 */
+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName Predicate:(NSPredicate *)predicate Offset:(NSInteger)offset {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:contect EntityName:entityName Predicate:predicate];
    if (offset > 0) {
        [fetchRequest setFetchOffset:offset];
    }
    return fetchRequest;
}
/*
 *  一般的按条件查找
 *  limit 取出的量
 *  按条件查找，并取出一定的量
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName Predicate:(NSPredicate *)predicate Limit:(NSInteger)limit {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:contect EntityName:entityName Predicate:predicate];
    if (limit > 0) {
        [fetchRequest setFetchLimit:limit];
    }
    return fetchRequest;
}
/*
 *  一般的按条件查找
 *  limit 取出的量
 *  offset 偏移位置
 *  按条件查找，并取出一定偏移下的量
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName Predicate:(NSPredicate *)predicate Offset:(NSInteger)offset Limit:(NSInteger)limit {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:contect EntityName:entityName Predicate:predicate];
    if (offset > 0) {
        [fetchRequest setFetchOffset:offset];
    }
    if (limit > 0) {
        [fetchRequest setFetchLimit:limit];
    }
    return fetchRequest;
}

/*
 *  基本使用  +   偏移使用  +  排序
 */

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortByAttributeName:(NSString *)sortDescriptorName Predicate:(NSPredicate *)predicate {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:contect EntityName:entityName Predicate:predicate];
    if (sortDescriptorName && ![sortDescriptorName isEqualToString:@""]) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortDescriptorName ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [fetchRequest setSortDescriptors:sortDescriptors];
    }
    return fetchRequest;
}

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortByAttributeName:(NSString *)sortDescriptorName Predicate:(NSPredicate *)predicate Offset:(NSInteger)offset {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:contect EntityName:entityName SortByAttributeName:sortDescriptorName Predicate:predicate];
    if (offset > 0) {
        [fetchRequest setFetchOffset:offset];
    }
    return fetchRequest;
}

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortByAttributeName:(NSString *)sortDescriptorName Predicate:(NSPredicate *)predicate Limit:(NSInteger)limit {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:contect EntityName:entityName SortByAttributeName:sortDescriptorName Predicate:predicate];
    if (limit > 0) {
        [fetchRequest setFetchLimit:limit];
    }
    return fetchRequest;
}

+ (NSFetchRequest *)fetchRequestWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName SortByAttributeName:(NSString *)sortDescriptorName Predicate:(NSPredicate *)predicate Offset:(NSInteger)offset Limit:(NSInteger)limit {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:contect EntityName:entityName SortByAttributeName:sortDescriptorName Predicate:predicate];
    if (offset > 0) {
        [fetchRequest setFetchOffset:offset];
    }
    if (limit > 0) {
        [fetchRequest setFetchLimit:limit];
    }
    return fetchRequest;
}

/*
 *  删除
 */

+ (NSFetchRequest *)fetchRequestDeleteWithManagedObjectContext:(NSManagedObjectContext *)contect EntityName:(NSString *)entityName {
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:contect];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setIncludesPropertyValues:NO];
    [fetchRequest setReturnsObjectsAsFaults:NO];
    
    return fetchRequest;
}

@end
