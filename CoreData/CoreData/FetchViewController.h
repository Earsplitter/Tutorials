//
//  FetchViewController.h
//  CoreData
//
//  Created by Brian Mendez on 12/27/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface FetchViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *context;

-(void) nameFunction;

@end
