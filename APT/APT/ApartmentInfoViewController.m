//
//  ApartmentInfoViewController.m
//  APT
//
//  Created by Aileen Taboy on 11/14/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "ApartmentInfoViewController.h"
#import "CreateAptViewController.h"



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
        self.appointmentDateLabel.text = [self.fromSegue objectForKey:@"apointmentTime"];
        
    }else {
        self.proPertyName.text = self.propertyString;
        self.LeaseLength.text = self.leaseString;

       

        
        
    }
    
   
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindFromModalViewController:(UIStoryboardSegue *)segue{
    
    if ([segue.sourceViewController isKindOfClass:[CreateAptViewController class]]) {
        CreateAptViewController *createAptView = segue.sourceViewController;
        if (createAptView.combinedDateAndTime) {
            self.appointmentTime = createAptView.combinedDateAndTime;
            self.appointmentDateLabel.text = self.appointmentTime;
            NSLog(@"%@",self.appointmentTime);
        }else {
            self.appointmentDateLabel.text = @"click Edit";
        }
        
       
    
    
    
    }

    
}


//   }
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
    
    NSString *appointmentTime = self.appointmentDateLabel.text;

    
    if (self.fromSegue) {

        
        
        self.fromSegue.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
        
        
        [self.fromSegue setObject:propertyName forKey:@"ApartmentName"];
        
        [self.fromSegue setObject:LeaseLength forKey:@"leaseLength"];
        
        [self.fromSegue setObject:appointmentTime forKey:@"apointmentTime"];
        
        
        [self.fromSegue saveInBackground];

    }else {
        

    
    PFObject *apartMentObject = [PFObject objectWithClassName:@"apartments"];
    
    apartMentObject.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
    
    
    [apartMentObject setObject:propertyName forKey:@"ApartmentName"];
    
    [apartMentObject setObject:LeaseLength forKey:@"leaseLength"];
        
    [apartMentObject setObject:appointmentTime forKey:@"apointmentTime"];
    
    
    [apartMentObject saveInBackground];
    
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
