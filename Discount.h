//
//  Discount.h
//  DiscountCalculator
//
//  Created by Christopher Katnic on 3/2/15.
//  Copyright (c) 2015 Christopher Katnic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Discount : NSObject
@property (retain, nonatomic) NSString*Original_Price;
@property (retain, nonatomic)NSString*Dollars_Off;
@property (retain, nonatomic)NSString*Discount_Pct;
@property (retain, nonatomic)NSString*Additional_Pct;
@property (retain, nonatomic)NSString*Tax_Pct;
@property (retain, nonatomic)NSString*Discount_Price;

-(void) DiscountNumber;

@end
