//
//  Product.h
//  Stock Edit
//
//  Created by HEENA RASTOGI on 7/9/14.
//  Copyright (c) 2014 Akankshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong, nonatomic) NSNumber *idProduct;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSDecimalNumber *regularPrice;
@property (strong, nonatomic) NSDecimalNumber *salePrice;
@property (strong, nonatomic) UIImage *productPhoto;
@property (strong, nonatomic) NSMutableArray *colors;
@property (strong, nonatomic) NSDictionary *stores;

-(id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@end
