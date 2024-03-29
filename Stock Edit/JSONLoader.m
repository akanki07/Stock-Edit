//
//  JSONLoader.m
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/11/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import "JSONLoader.h"
#import "Product.h"

@implementation JSONLoader

- (NSArray *)productsFromJSONFile:(NSURL *)url {
    
    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    // Get the data
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // Now create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    // Create a new array to hold the products
    NSMutableArray *products = [[NSMutableArray alloc] init];
    
    // Get an array of dictionaries with the key "locations"
    NSArray *array = [jsonDictionary objectForKey:@"products"];
    
    // Iterate through the array of dictionaries
    for(NSDictionary *dict in array) {
        // Create a new Product object for each one and initialise it with information in the dictionary
        Product *product = [[Product alloc] initWithJSONDictionary:dict];
        // Add the Location object to the array
        [products addObject:product];
    }
    
  

    // Return the array of Location objects
    return products;
}


@end
