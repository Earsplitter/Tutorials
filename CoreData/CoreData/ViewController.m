//
//  ViewController.m
//  CoreData
//
//  Created by Brian Mendez on 12/20/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "FetchViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, readwrite, strong) NSMutableArray *people;
@property NSMutableArray *names;
@property FetchViewController *fetchController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSManagedObjectContext *context;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];

    self.people = [[NSMutableArray alloc] init];
    self.names = [[NSMutableArray alloc] init];
//    self.fetchController = [[FetchViewController alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.title = @"The List";
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.names.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.names objectAtIndex:indexPath.row];
    
    
    return  cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addName:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Name" message:@"Add a new name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save", nil];

    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        NSLog(@"Saved");
        UITextField *textField = [alertView textFieldAtIndex:0];
        NSLog(@" test test: %@", [alertView textFieldAtIndex:0]);
        [self.names addObject:textField.text];
        
        FetchViewController *fetchController = [[FetchViewController alloc] init];
        [fetchController nameFunction];
        
        [self.tableView reloadData];
        NSLog(@"names: %lu", self.names.count);
    } else if (buttonIndex == 0) {
        NSLog(@"Cancelled");
    }
}


@end
