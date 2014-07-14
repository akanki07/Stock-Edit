//
//  DetailViewController.h
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/10/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "sqlite3.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic)Product *product;
@property (strong,nonatomic) NSString *selectedProduct;

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *stockDB;


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UITextField *idText;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UITextField *regularPriceText;

@property (weak, nonatomic) IBOutlet UITextField *salePriceText;
- (IBAction)updatePressed:(id)sender;



- (IBAction)deletePressed:(id)sender;
-(IBAction)textFieldReturn:(id)sender;



@end
