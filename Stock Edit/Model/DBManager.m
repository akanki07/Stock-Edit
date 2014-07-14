//
//  DBManager.m
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/13/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import "DBManager.h"

@implementation DBManager


-(void)createTables
{
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    _databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:
                                                       @"stock12.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: _databasePath ] == NO)
    {
        const char *dbpath = [_databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &_stockDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS STOCK1 (ID INTEGER, NAME TEXT, DESCRIPTION BLOB, REGULAR_PRICE REAL, SALE_PRICE REAL)";
            
            if (sqlite3_exec(_stockDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Failed to create table");
            }
            sqlite3_close(_stockDB);
        } else {
            NSLog(@"Failed to open/create database");
        }
    }
}

@end
