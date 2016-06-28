//
//  ViewController.m
//  DiscountCalculator
//
//  Created by Christopher Katnic on 2/24/15.
//  Copyright (c) 2015 Christopher Katnic. All rights reserved.
//

#import "ViewController.h"
#import "Discount.h"
#import <UIKit/UIKit.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *Price_Text_Field;
@property (weak, nonatomic) IBOutlet UITextField *Dollars_Off_Text_Field;
@property (weak, nonatomic) IBOutlet UITextField *Discount_Pct_Text_Field;
@property (weak, nonatomic) IBOutlet UITextField *Additional_Pct_Discount_Field;
@property (weak, nonatomic) IBOutlet UILabel *Discount_Price_Label;
@property (weak, nonatomic) IBOutlet UILabel *Original_Price_Label;

@end

@implementation ViewController











//                  Standard system functions
//-------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    // Allocate Discount object to store data when the view loads
    self.d = [[Discount alloc] init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)textfieldreturn:(id)sender {
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    int next = (textField.tag + 1) % 4;
    
    UIResponder* Next_Responder = [textField.superview viewWithTag:next];
    [Next_Responder becomeFirstResponder];
    return NO;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
//---------------------------------------------------------------------------





//  This function will execute whenever the user changes a value in any
//  given text field.
//  It is a minor hack - the function's normal use case is to flag a string
//  for replacement of characters, but the fact that its body executes during
//  runtime whenever a user changes a value in a text field can be utilized
//  in order to maintain the "cash register" effect.
//---------------------------------------------------------------------------
- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
{
    NSMutableString *Text_Entry = [NSMutableString stringWithString:[textField text]];
    [Text_Entry replaceCharactersInRange:range withString:string];
    //strip decimal, replace decimal
    Text_Entry = [Text_Entry stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    
    NSMutableString* t2 = [NSMutableString stringWithFormat:@"%03d", [Text_Entry intValue]];
    [t2 insertString:@"." atIndex:[t2 length] -2];
    
    [textField setText:t2];
    

    
    return NO;
}
//---------------------------------------------------------------------------




//
//  Function used to build graphs and set label values
//  this is called in two places
//
-(void)Set_All_Values {
    [_Original_Price_Label setText:[_Price_Text_Field text]];
    
    
    int price = [[_Price_Text_Field text] floatValue] * 100;
    NSLog(@"%i", price);
    
    self.d.Original_Price = _Original_Price_Label.text;
    self.d.Dollars_Off = _Dollars_Off_Text_Field.text;
    self.d.Discount_Pct = _Discount_Pct_Text_Field .text;
    self.d.Additional_Pct = _Additional_Pct_Discount_Field.text;
    self.d.Tax_Pct = @"8.75";
    self.d.DiscountNumber;
    [_Discount_Price_Label setText:self.d.Discount_Price];
}


//  This function is overwritten in order to pass the object containing all
//  of the values that the user has entered in.
//---------------------------------------------------------------------------
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

        ViewController *destination = segue.destinationViewController;
        destination.d = self.d;
        [self Set_All_Values];
    
}
//---------------------------------------------------------------------------


-(void)Create_Toolbar_Above_Keyboard {
    UIBarButtonItem *test = [[UIBarButtonItem alloc]init];
    UIToolbar *tb = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    tb.barStyle= UIBarStyleBlackTranslucent;
    tb.items = [[NSArray alloc] initWithObjects:test, nil];
    [tb sizeToFit];
    _Price_Text_Field.inputAccessoryView = tb;
}

//  This function executes when the Calculate button is pressed
//  This will extract all of the information that the user has put into the text
//  fields and place them into an object to store the data
//---------------------------------------------------------------------------
- (IBAction)changestuff:(id)sender {

    [self Set_All_Values];
}
//---------------------------------------------------------------------------




@end
