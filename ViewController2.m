//
//  ViewController2.m
//  DiscountCalculator
//
//  Created by Christopher Katnic on 3/2/15.
//  Copyright (c) 2015 Christopher Katnic. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"

@interface ViewController2()
@property (weak, nonatomic) IBOutlet UILabel *Newlabel;
@property (weak, nonatomic) IBOutlet UILabel *TopDollar;
@property (weak, nonatomic) IBOutlet UILabel *TopPct;
@property (weak, nonatomic) IBOutlet UILabel *BotDollar;
@property (weak, nonatomic) IBOutlet UILabel *BotPct;


@end

@implementation ViewController2



//  In order to load the bar graphs when the button is pressed,
//  the graphs are created within viewDidLoad
//  The graphs access data members of object "d" which is the Discount object
//  The discount object simply stores all of the data that was entered in by
//  the user in the last view
//-------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    self.d.DiscountNumber;  //create the final total and store into d
    [_Newlabel setText:(@"$%@", (self.d.Original_Price))];
    
    
    
    if(self.d.Discount_Price)
    {
        //Create left bar
        UIView*boxTotal  = [[UIView alloc] initWithFrame:CGRectMake(0, 65, 186, 530)];
        boxTotal.backgroundColor = [UIColor greenColor];
        boxTotal.layer.borderWidth = 5;
        [self.view addSubview:boxTotal];
        [self.view sendSubviewToBack:boxTotal];

        //create float variables that can be used to calculate the height/position of respective right bars
        float discountedPercent = ( self.d.Discount_Price.floatValue / self.d.Original_Price.floatValue );
        float inversediscountedpercent = 1 - discountedPercent;
        int h = (610 * inversediscountedpercent);
        
        //create top right bar (this is amount saved)
        UIView *boxTop = [[UIView alloc] initWithFrame:CGRectMake(170, 65, 150, h)];
        boxTop.backgroundColor = [UIColor blueColor];
        boxTop.layer.borderWidth = 5;
        [self.view addSubview:boxTop];
        [self.view sendSubviewToBack:boxTop];
        
        //create bottom bar (this is amount spent)
        UIView *boxBot = [[UIView alloc] initWithFrame:CGRectMake(170, 65 + h, 150, 530 - h)];
        boxBot.backgroundColor = [UIColor redColor];
        boxBot.layer.borderWidth = 5;
        [self.view addSubview:boxBot];
        [self.view sendSubviewToBack:boxBot];
        
        //get actual percentages of discount for display purposes
        discountedPercent *= 100;
        inversediscountedpercent *= 100;
        float saved = self.d.Original_Price.floatValue - self.d.Discount_Price.floatValue;

        //set labesl
        [_TopDollar setText:[NSString stringWithFormat:@"$%.2f", saved]];
        [_TopPct setText:[NSString stringWithFormat:@"%.2f%%", inversediscountedpercent]];

        [_BotDollar setText:[NSString stringWithFormat:@"$%@", self.d.Discount_Price]];
        [_BotPct    setText:[NSString stringWithFormat:@"%.2f%%", discountedPercent]];
        
        
    }
    
    
    
    
}
//-------------------------------------------------------------------------







//                  Standard system functions
//-------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)textfieldreturn:(id)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];

    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
//-------------------------------------------------------------------------



@end
