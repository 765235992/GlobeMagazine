//
//  HXWCoreDataManager.m
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import "HXWCoreDataManager.h"
#warning mark - Change your CoreDataFileName
#define CoreDataFileName @"Model"
@implementation HXWCoreDataManager


#pragma mark - Init for CoreData
- (void)initCoreData {
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator) {
        
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
        
    }
}




#pragma mark - Creating the parent context
// Just create your
// NSManagedObjectModel
// and
// NSPersistentStoreCoordinator
// as before

// Initialize the parent
// NSManagedObjectContext
// by setting its concurrency type to
// NSMainQueueConcurrencyType

//Set the persistentStoreCoordinator of the newly created context
- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:[NSManagedObjectModel URLForManagedObjectModelName:CoreDataFileName]];
    return model;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [NSPersistentStoreCoordinator URLForNSPersistentStoreCoordinatorName:CoreDataFileName];
    NSError *error = nil;
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return persistentStoreCoordinator;
}

@end
