//
//  ApartmentInfoViewController.m
//  APT
//
//  Created by Aileen Taboy on 11/14/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "ApartmentInfoViewController.h"
#import "CreateAptViewController.h"
#import "PhotosViewController.h"
#import "PhotosCollectionViewController.h"



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
        
        self.proPertyName.text = @"unamed property";  
        
//        self.proPertyName.text = self.propertyString;
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


#pragma mark - Navigation 
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier]isEqualToString:@"photos"]) {
        
        PhotosViewController *apartmentObject = segue.destinationViewController;

        //stop user from not setting a property name
        if ([self.proPertyName.text isEqualToString:@"unamed property"]) {
            UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Oh No!" message:@"Make sure you name your property before adding photos!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alertView addAction:defaultAction];
            [self presentViewController:alertView animated:YES completion:nil];
        }else{
        
        
        apartmentObject.currentPfObject = self.fromSegue;
        
        apartmentObject.keyForPfObject = self.proPertyName.text;
        
//            NSLog(@"current pfobject being passed %@", self.fromSegue);
        }
 
    }else if ([[segue identifier]isEqualToString:@"allPhotos"]){
        
        PhotosCollectionViewController *allPhotos = segue.destinationViewController;
        
        allPhotos.pfObjectfromInfoView = self.fromSegue;
        
//        NSLog(@"showing all photos %@", self.fromSegue);
        
        
    }
    
    
    
    
}









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
