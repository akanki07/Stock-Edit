//
//  DetailViewController.m
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/10/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    [self setTitle:@"Detail"];
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
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT * FROM STOCK1 WHERE name=\"%@\"",
                              _selectedProduct];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_stockDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *idField = [[NSString alloc]
                                          initWithUTF8String:
                                          (const char *) sqlite3_column_text(
                                                                             statement, 0)];
                _idText.text = idField;
                NSString *nameField = [[NSString alloc]
                                        initWithUTF8String:(const char *)
                                        sqlite3_column_text(statement, 1)];
                _nameLabel.text = nameField;
                NSString *descriptionField = [[NSString alloc]
                                       initWithUTF8String:(const char *)
                                       sqlite3_column_text(statement, 2)];
                _descriptionText.text = descriptionField;
                
                NSString *regularPriceField = [[NSString alloc]
                                       initWithUTF8String:(const char *)
                                       sqlite3_column_text(statement, 3)];
                _regularPriceText.text=regularPriceField;
                
                NSString *salePriceField = [[NSString alloc]
                                       initWithUTF8String:(const char *)
                                       sqlite3_column_text(statement, 4)];
                _salePriceText.text = salePriceField;
                
                
            }             sqlite3_finalize(statement);
        }
        sqlite3_close(_stockDB);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updatePressed:(id)sender {
    
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
        NSString *updateSQL = [NSString stringWithFormat:
                               @"UPDATE STOCK1 SET ID =\"%@\", REGULAR_PRICE =\"%@\", SALE_PRICE =\"%@\" WHERE NAME = \"%@\"",_idText.text,_regularPriceText.text,_salePriceText.text,_nameLabel.text];
        
        const char *update_stmt = [updateSQL UTF8String];
        
        sqlite3_prepare_v2(_stockDB, update_stmt,
                           -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"DONE" message: @"Product Information Updated!!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            
        }
        sqlite3_finalize(statement);
        
        sqlite3_close(_stockDB);
    }
    
}



- (IBAction)deletePressed:(id)sender {
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
        NSString *deleteSQL = [NSString stringWithFormat:
                              @"DELETE FROM STOCK1 WHERE NAME = \"%@\" AND ID = \"%@\"",
                              _nameLabel.text, _idText.text];
        
        const char *delete_stmt = [deleteSQL UTF8String];
        
        sqlite3_prepare_v2(_stockDB, delete_stmt,
                           -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            _idText.text = @"";
            _nameLabel.text = @"";
            _regularPriceText.text=@"";
            _salePriceText.text = @"";
            _descriptionText.text = @"";
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"DONE" message: @"Product Information Deleted!!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        sqlite3_finalize(statement);
    
        sqlite3_close(_stockDB);
    }

}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}




@end
