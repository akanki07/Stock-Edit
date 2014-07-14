//
//  ProductCollection.m
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/9/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import "ProductCollection.h"

@interface ProductCollection()

@property (strong,nonatomic) NSMutableArray *products;

@end


@implementation ProductCollection


-(NSMutableArray *) products
{
    if(!_products)
        _products = [[NSMutableArray alloc] init];
    
    return _products;
}

- (void) addProduct:(Product *) product
{
    [self.products addObject:product];
    
}

@end
