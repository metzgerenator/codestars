//
//  ApartmentInfoViewController.m
//  APT
//
//  Created by Aileen Taboy on 11/14/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "ApartmentInfoViewController.h"



@interface ApartmentInfoViewController ()

@end

//apartmentInfo.propertyString = [objet objectForKey:@"ApartmentName"];
//apartmentInfo.leaseString = [objet objectForKey:@"leaseLength"]

@implementation ApartmentInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.fromSegue) {
        self.proPertyName.text = [self.fromSegue objectForKey:@"ApartmentName"];
        self.LeaseLength.text = [self.fromSegue objectForKey:@"leaseLength"];
    }else {
        self.proPertyName.text = self.propertyString;
        self.LeaseLength.text = self.leaseString;
        self.appointmentDateLabel.text = self.appointmentTime;
       

        
        
    }
    
   
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - save and cancel

- (IBAction)saveActionButton:(id)sender {
    
    NSString *propertyName = self.proPertyName.text;
    
    NSString* LeaseLength = self.LeaseLength.text;

    
    if (self.fromSegue) {

        
        
        self.fromSegue.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
        
        
        [self.fromSegue setObject:propertyName forKey:@"ApartmentName"];
        
        [self.fromSegue setObject:LeaseLength forKey:@"leaseLength"];
        
        
        [self.fromSegue saveInBackground];

    }else {
        

    
    PFObject *apartMentObject = [PFObject objectWithClassName:@"apartments"];
    
    apartMentObject.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
    
    
    [apartMentObject setObject:propertyName forKey:@"ApartmentName"];
    
    [apartMentObject setObject:LeaseLength forKey:@"leaseLength"];
    
    
    [apartMentObject saveInBackground];
    
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
