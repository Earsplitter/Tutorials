//
//  ViewController.h
//  CoreData
//
//  Created by Brian Mendez on 12/20/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, readonly, strong) NSMutableArray *people;

@end

