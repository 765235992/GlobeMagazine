//
//  NSPersistentStoreCoordinator+HXWPersistentStoreCoordinator.m
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import "NSPersistentStoreCoordinator+HXWPersistentStoreCoordinator.h"

@implementation NSPersistentStoreCoordinator (HXWPersistentStoreCoordinator)
+ (NSURL *)URLForNSPersistentStoreCoordinatorName:(NSString *)fileName {
    NSString *dbFileName = [NSString stringWithFormat:@"%@.sqlite", fileName];
    return [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:dbFileName];
}

@end
