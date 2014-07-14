//
//  CreateViewController.h
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/9/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface CreateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *idText;

- (IBAction)addPressed:(id)sender;


@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *stockDB;

@end
