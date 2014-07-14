//
//  CreateViewController.m
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/9/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import "CreateViewController.h"
#import "JSONLoader.h"
#import "Product.h"
#import "DBManager.h"

@interface CreateViewController ()

//@property (strong, nonatomic) NSArray *products;

@end

@implementation CreateViewController
{
    NSArray *_products;
}

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
    
    // Create a new JSONLoader with a local file URL
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"products" withExtension:@"json"];
    
    // Load the data.
    _products = [jsonLoader productsFromJSONFile:url];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPressed:(id)sender {
    
    BOOL isAdded = NO;
    
    NSNumber  *idNumber = [NSNumber numberWithInteger: [_idText.text integerValue]];
    
    for( Product *prod in _products)
    {
        
        if([prod.idProduct isEqualToNumber:idNumber]){
            
            NSString *docsDir;
            NSArray *dirPaths;
            
            // Get the documents directory
            dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            docsDir = dirPaths[0];
            
            // Build the path to the database file
            _databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:
                                                               @"stock12.db"]];
            
            const char *dbpath = [_databasePath UTF8String];
            
            sqlite3_stmt    *statement;
            
            if (sqlite3_open(dbpath, &_stockDB) == SQLITE_OK)
            {
               // NSData *dataColor = [NSKeyedArchiver archivedDataWithRootObject:prod.colors];
               // NSData *dataStore = [NSKeyedArchiver archivedDataWithRootObject:prod.stores];
                
                NSString *insertSQL = [NSString stringWithFormat:
                                       @"INSERT INTO STOCK1 (ID, NAME, DESCRIPTION, REGULAR_PRICE, SALE_PRICE) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",[prod.idProduct stringValue], prod.name, prod.description, [prod.regularPrice stringValue], [prod.salePrice stringValue]];
                
                const char *insert_stmt = [insertSQL UTF8String];
                sqlite3_prepare_v2(_stockDB, insert_stmt,-1, &statement, NULL);
                if (sqlite3_step(statement) == SQLITE_DONE)
                {
                    isAdded = YES;
                    _idText.text = @"";
                } else {
                    NSLog(@"failed");
                }
                sqlite3_finalize(statement);
                sqlite3_close(_stockDB);
            }

            
        }
            
    }
    if(isAdded == NO)
    {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Sorry" message: @"Wrong Id!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];

    }
    
    
    
    
    }
@end
