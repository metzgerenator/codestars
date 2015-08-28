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
    NSNumber *currentDisplayFromAction1;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clearButton:(UIButton *)clear{
    
    //instance of current UILable
    UILabel *displayBeforeClear = self.readout;
    
    //convert to string
    NSString *stringBeforeClear = displayBeforeClear.text;
    
    //convert string to float
    float displayBeforeZero = [stringBeforeClear floatValue];
    
    //set value to 0
    displayBeforeZero = 0;
    
    //convert to NSNumber
    NSNumber *zeroValue = [NSNumber numberWithFloat:displayBeforeZero];
    
    //change ivar currentDisplayFromAction1
    currentDisplayFromAction1 = zeroValue;
    
    //make a string that says 0
    NSString *zeroedDsiplay = @"0";
    self.readout.text = zeroedDsiplay;
    
    NSLog(@" stringBeforeClear %@", zeroValue);
    
    
    
    

    
    NSLog(@" current disply from button clear is %@", currentDisplayFromAction1);
    
    
    
}



-(IBAction)numberReader:(UIButton*)button{
    ///take UIButton and convert to string
    NSString *buttonHit = [button   currentTitle];
    
    //create instance of UILable that is equal to current readout
    UILabel *display = self.readout;
    
    //convert UILabel display to NSString for appending operation
    NSString *currentDisplaytext  = display.text;
    
    //append the next UIButton action to what is currently displayed
    NSString *combinedString = [currentDisplaytext stringByAppendingString:buttonHit];
    
    //set display equal to combinedString
    self.readout.text = combinedString;
    
    //convert combinedString to a Float
    float totalButtonDisplayNumber = [combinedString floatValue];
    
    //conveert float to instance of NSNumber
    NSNumber *numberForVariable = [NSNumber numberWithFloat:totalButtonDisplayNumber];
    
    //set ivar to total NSNumber conversion from display
    currentDisplayFromAction1 = numberForVariable;
    
    //logging total NSNumber that is assigning to ivar
//    NSLog(@" this is total number output %@", numberForVariable);
//    
//    NSLog(@"%f this is the float", totalButtonDisplayNumber);
    
    
    
    
    
}


@end
