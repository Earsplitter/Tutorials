//
//  FetchViewController.m
//  CoreData
//
//  Created by Brian Mendez on 12/27/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "FetchViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"


@interface FetchViewController ()

@property ViewController *controller;

@end

@implementation FetchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.context = [appDelegate managedObjectContext];
    
    self.controller = [[ViewController alloc]init];
    
    
}

-(void) nameFunction {
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:self.context];
    NSManagedObject *newPerson = [[NSManagedObject alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:self.context];
    [newPerson setValue:self.controller.people forKey:@"name"];

    NSError *error;
    
    [self.context save:&error];
    NSLog(@"%@", self.context);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
