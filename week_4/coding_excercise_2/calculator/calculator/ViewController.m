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
    NSDictionary *numberKeys;
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
    NSString *buttonHit2;
    
    float buttonNumber = [buttonHit floatValue];

    if (buttonNumber == 0.0) {
        
        buttonHit2 = [button currentTitle];
        
    } else if ([buttonHit  isEqual: @"x"]) {
        
        NSLog(@"%@", buttonHit2);
    }
    
    
    NSLog(@"%f" , buttonNumber);
    
}


@end
