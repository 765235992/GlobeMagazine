//
//  NSManagedObject+HXWManagedObject.m
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import "NSManagedObject+HXWManagedObject.h"
#import "HXWCoreDataEventManager.h"

@implementation NSManagedObject (HXWManagedObject)
+ (id)createNSManagedObjectForName:(NSString *)name {
    /*
     *  在主线程中插入
     */
    HXWCoreDataEventManager *coreDataDao = [HXWCoreDataEventManager sharedInstance];
    
    NSManagedObjectContext *context = [coreDataDao managedObjectContext];
    
    return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:context];
}

+ (void)deleteNSManagedObject:(id)object {
    
    HXWCoreDataEventManager *coreDataDao = [HXWCoreDataEventManager sharedInstance];
    NSManagedObjectContext *context = [coreDataDao managedObjectContext];

    [context deleteObject:object];
}

@end
