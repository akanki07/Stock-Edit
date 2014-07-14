//
//  JSONLoader.h
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/11/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONLoader : NSObject

// Return an array of Product objects from the json file at location given by url
- (NSArray *)productsFromJSONFile:(NSURL *)url;


@end
