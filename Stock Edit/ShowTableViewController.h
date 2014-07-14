//
//  ShowTableViewController.h
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/9/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface ShowTableViewController : UITableViewController

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *stockDB;



@end
