//
//  SignupViewController.h
//  Travel Buddy
//
//  Created by Aileen Taboy on 10/16/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;



- (IBAction)signup:(id)sender;

@end
