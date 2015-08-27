//
//  ViewController.m
//  calculator
//
//  Created by Aileen Taboy on 8/26/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

{
    NSNumber *numberfromAction1;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)numberReader:(UIButton*)button{
    
    NSString *buttonHit = [button   currentTitle];
//    self.readout.text = buttonHit;
    UILabel *display = self.readout;
    NSString *currentDisplaytext  = display.text;
    
    NSString *combinedString = [currentDisplaytext stringByAppendingString:buttonHit];
    self.readout.text = combinedString;
    
    
    float buttonNumber = [combinedString floatValue];
    
    NSLog(@" this is total number output %f", buttonNumber);
    
    

    NSString *notANumber;
    //  operator value
    float numberInput1;
    float numberInput2;
    float numberInputResult;
    float multiplication = numberInput1 * numberInput2;
    float division = numberInput1 / numberInput2;
    float subtraction = numberInput1 - numberInput2;
    float addition = numberInput1 + numberInput2;
    

    //Action for function buttons
 
    
    if ([buttonHit  isEqual: @"x"]) {
        
        
        NSLog(@" this is x %@", buttonHit);

    }

//    if (buttonNumber == 0.0) {
//        
//        buttonHit2 = [button currentTitle];
////        NSLog(@" this is button hit 2 %@", buttonHit2);
//        
//    } else if ([buttonHit  isEqual: @"x"]) {
//        
//        NSLog(@" this is x %@", buttonHit);
//    }
//
    
    
    
    
    NSLog(@"%f" , buttonNumber);
    
}


@end
