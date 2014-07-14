//
//  ViewController.m
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/9/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import "ViewController.h"
#import "CreateViewController.h"
#import "ShowTableViewController.h"
#import "DBManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"MainView"];
    DBManager *dbmanager = [[DBManager alloc]init];
    [dbmanager createTables];

    // Do any additional setup after loading the view from its nib.
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)createProductPressed:(id)sender {
    CreateViewController *createViewController = [[CreateViewController alloc] initWithNibName:@"CreateViewController" bundle:nil];
    
    [self.navigationController pushViewController:createViewController animated:YES];
}

- (IBAction)showProductPressed:(id)sender {
    ShowTableViewController *showTableViewController = [[ShowTableViewController alloc] initWithNibName:@"ShowTableViewController" bundle:nil];
    
    [self.navigationController pushViewController:showTableViewController animated:YES];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
