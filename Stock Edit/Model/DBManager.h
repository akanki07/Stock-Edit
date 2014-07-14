//
//  DBManager.h
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/13/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *stockDB;

-(void)createTables;
    
@end
