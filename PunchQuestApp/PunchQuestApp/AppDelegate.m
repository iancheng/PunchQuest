//
//  AppDelegate.m
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import "AppDelegate.h"
#import "User.h"
#import <RestKit/RestKit.h>
//#import <Parse/Parse.h>

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

//    setupRestKit();
//    
//    NSError *error = nil;
//    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"RKGist" ofType:@"momd"]];
//    // NOTE: Due to an iOS 5 bug, the managed object model returned is immutable.
//    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
//    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
//    
//    // Initialize the Core Data stack
//    [managedObjectStore createPersistentStoreCoordinator];
//    
//    NSPersistentStore __unused *persistentStore = [managedObjectStore addInMemoryPersistentStore:&error];
//    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);
//    
//    [managedObjectStore createManagedObjectContexts];
//    
//    // Set the default store shared instance
//    [RKManagedObjectStore setDefaultStore:managedObjectStore];

    
<<<<<<< HEAD
    
    
    
=======
>>>>>>> c90da64146da20310abc54e58a82a2a8708a62aa
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;
    }
    
//    [Parse setApplicationId:@"0L7CfyAXrcU93M9dyAeNeVah0GAcvCNlsQpZ29fy"
//                  clientKey:@"XA52PhIHlzarKD5nXYEog6litsJENGc8oLNgj0jx"];
//    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)setupRestKit {
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://www.rent2play.ca/testing/api"]];
    
//    [[manager HTTPClient] setDefaultHeader:@"X-Parse-REST-API-Key" value:@"your key"];
//    [[manager HTTPClient] setDefaultHeader:@"X-Parse-Application-Id" value:@"your key"];
    
    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    manager.managedObjectStore = managedObjectStore;
}



@end
