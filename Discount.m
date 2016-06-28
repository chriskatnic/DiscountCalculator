//
//  Discount.m
//  DiscountCalculator
//
//  Created by Christopher Katnic on 3/2/15.
//  Copyright (c) 2015 Christopher Katnic. All rights reserved.
//

#import "Discount.h"
#import <UIKit/UIKit.h>


@implementation Discount
- (instancetype)init
{
    self = [super init];
    if (self) {
        _Original_Price = @".";
    }
    return self;
}


//calculate the final price, store in value in object
-(void) DiscountNumber{
        
        float price = [_Original_Price floatValue];
        float dollarsoff = [_Dollars_Off floatValue];
        float discountpct = [_Discount_Pct floatValue];
        float additionalpct = [_Additional_Pct floatValue];
        float taxpct2 = [_Tax_Pct floatValue];
        
        float runningtotal = price;                 //total so far
        float taxamount = price * (taxpct2 / 100); //this is how much to subtract from total (tax)
        runningtotal -= dollarsoff;                 //total - dollars off
        runningtotal -= (runningtotal * (discountpct / 100)); //total - discountpct / 100
        runningtotal -= (runningtotal * (additionalpct / 100)); //total - additional shit
        runningtotal += taxamount;
        
        NSString * final = [NSString stringWithFormat:@"%.2f", runningtotal];
        NSLog(@"%@", final);
    
        _Discount_Price = final;
}
@end
