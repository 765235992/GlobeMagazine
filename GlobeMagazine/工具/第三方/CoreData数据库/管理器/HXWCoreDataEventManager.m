//
//  HXWCoreDataEventManager.m
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import "HXWCoreDataEventManager.h"

@implementation HXWCoreDataEventManager
#pragma mark - SingleInstance
static HXWCoreDataEventManager *shareInstance = nil;

+ (HXWCoreDataEventManager *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[HXWCoreDataEventManager alloc] init];
        [shareInstance initCoreData];
    });
    return shareInstance;
}

- (void)saveContext
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    [context performBlock:^{
        NSError *saveError = nil;
        if ([context save:&saveError]) {
#warning 是否需要LOG
//            NSLog(@"保存成功");
        }else{
            NSLog(@"保存失败");
            
        }

    }];
    
}
/*
 *  判断是否有该数据
 */
- (BOOL)isHaveWithEntity:(NSString *)entityName attributeName:(NSString *)attributeName value:(id)value
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", attributeName, value];
    NSFetchRequest *fetchRequst = [NSFetchRequest fetchRequestWithManagedObjectContext:context EntityName:entityName SortByAttributeName:attributeName Predicate:predicate];
    NSError *error = nil;
    NSArray *resultArray = [context executeFetchRequest:fetchRequst error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    if ([resultArray count]) {
        return YES;
    }
    return NO;
}
/*
 *  清空某一类的所有对象
 */

- (void)deleteWithEntity:(NSString *)entityName
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequst = [NSFetchRequest fetchRequestDeleteWithManagedObjectContext:self.managedObjectContext EntityName:entityName];
    
    NSError *error = nil;
    NSArray *resultArray = [context executeFetchRequest:fetchRequst error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    if ([resultArray count]) {
        for (id obj in resultArray) {
            [self.managedObjectContext deleteObject:obj];
        }
    }
    NSLog(@"删除");
    [self saveContext];
    
}

/*
 *  删除某一个对象
 */
- (void)deleteWithEntity:(NSString *)entityName attributeName:(NSString *)attributeName value:(id)value
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", attributeName, value];
    NSFetchRequest *fetchRequst = [NSFetchRequest fetchRequestWithManagedObjectContext:context EntityName:entityName SortByAttributeName:attributeName Predicate:predicate];
    NSError *error = nil;
    NSArray *resultArray = [context executeFetchRequest:fetchRequst error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    if ([resultArray count]) {
        for (id obj in resultArray) {
            [self.managedObjectContext deleteObject:obj];
        }
    }
    [self saveContext];
    
}

- (NSArray *)selectAttributeForEntity:(NSString *)entityName {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entityName];
    return [context executeFetchRequest:fetchRequest error:nil];
}

- (NSArray *)selectAttributeForEntity:(NSString *)entityName sortByAttributeName:(NSString *)sortDescriptorName {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:context EntityName:entityName SortDescriptorName:sortDescriptorName];
    return [context executeFetchRequest:fetchRequest error:nil];
}

/*
 *  取出某一类所有对象 并根据特定内容进行排序
 */
- (NSArray *)selectAttributeForEntity:(NSString *)entityName attributeName:(NSString *)attributeName value:(id)value sortByAttributeName:(NSString *)sortDescriptorName
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", attributeName, value];

    NSFetchRequest *fetchRequst = [NSFetchRequest fetchRequestWithManagedObjectContext:context EntityName:entityName SortByAttributeName:attributeName Predicate:predicate];
    if (sortDescriptorName && ![sortDescriptorName isEqualToString:@""]) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortDescriptorName ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [fetchRequst setSortDescriptors:sortDescriptors];
    }
    
    NSError *error = nil;
    NSArray *resultArray = [context executeFetchRequest:fetchRequst error:&error];
    [self saveContext];
    
    return resultArray;

}
/*
 *  取出某一个关键字的所有信息
 */
- (NSArray *)selectAttributeForEntity:(NSString *)entityName attributeName:(NSString *)attributeName value:(id)value
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", attributeName, value];
    NSFetchRequest *fetchRequst = [NSFetchRequest fetchRequestWithManagedObjectContext:context EntityName:entityName SortByAttributeName:attributeName Predicate:predicate];
    NSError *error = nil;
    NSArray *resultArray = [context executeFetchRequest:fetchRequst error:&error];
    [self saveContext];

    return resultArray;
}
/*
 *  偏移查询
 */
- (NSArray *)selectAttributeForEntity:(NSString *)entityName sortByAttributeName:(NSString *)sortDescriptorName Offset:(NSInteger)offset Limit:(NSInteger)limit
{

    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:context EntityName:entityName SortByAttributeName:sortDescriptorName Offset:offset Limit:limit];
    return [context executeFetchRequest:fetchRequest error:nil];

}

- (NSArray *)selectAttributeForEntity:(NSString *)entityName attributeName:(NSString *)attributeName value:(id)value sortByAttributeName:(NSString *)sortDescriptorName Offset:(NSInteger)offset Limit:(NSInteger)limit
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithManagedObjectContext:context EntityName:entityName SortByAttributeName:sortDescriptorName Offset:offset Limit:limit];
    return [context executeFetchRequest:fetchRequest error:nil];
}






















@end
