//
//  Product.m
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/9/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import "Product.h"

@implementation Product

// Init the object with information from a dictionary
-(id)initWithJSONDictionary:(NSDictionary *)jsonDictionary{
    
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _idProduct = [jsonDictionary objectForKey:@"id"];
        _name = [jsonDictionary objectForKey:@"name"];
        _description = [jsonDictionary objectForKey:@"description"];
        _regularPrice = [jsonDictionary objectForKey:@"regularPrice"];
        _salePrice = [jsonDictionary objectForKey:@"salePrice"];
        
        /*NSArray *colorsArray = [jsonDictionary objectForKey:@"colors"];
        _colors =[[NSMutableArray alloc]init];
        for(NSString* color in colorsArray)
        {
            [_colors addObject:color];
            NSLog(@"COLOR ADD");
        }
        
        
        NSArray *storesArray = [jsonDictionary objectForKey:@"stores"];
        _stores =[[NSDictionary alloc]init];
        for(NSDictionary* store in storesArray)
        {
            [_stores setValue:[store objectForKey:@"value"] forKey:[store objectForKey:@"key"]];
            NSLog(@"Store ADD");
        }*/
    }
  return self;
    
}




@end
