//
//  HXWCoreDataManager.h
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSFetchRequest+HXWFetchRequest.h"
#import "NSManagedObject+HXWManagedObject.h"
#import "NSManagedObjectModel+HXWManagedObjectModel.h"
#import "NSPersistentStoreCoordinator+HXWPersistentStoreCoordinator.h"

@interface HXWCoreDataManager : NSObject
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;

@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)initCoreData;
@end
