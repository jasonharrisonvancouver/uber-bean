//
//  AppDelegate.h
//  UberBean
//
//  Created by jason harrison on 2019-01-25.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

