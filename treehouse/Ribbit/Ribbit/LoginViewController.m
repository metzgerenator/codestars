//
//  LoginViewController.m
//  Ribbit
//
//  Created by Aileen Taboy on 11/10/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    
}



- (IBAction)login:(id)sender {
    
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    
    if ([username length] == 0 || [password length] ==0 ) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"Make sure you enter a username and password!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
        
        [alertView addAction:defaultAction];
        
        [self presentViewController:alertView animated:YES completion:nil];
    }else {
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * _Nullable user, NSError * _Nullable error) {
            
            
            
            
            if (error) {
                UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
                
                [alertView addAction:defaultAction];
                
                [self presentViewController:alertView animated:YES completion:nil];
            }else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }

            
            
        }];
    }
    
}
@end
