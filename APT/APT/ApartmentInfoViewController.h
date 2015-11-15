//
//  ApartmentInfoViewController.h
//  APT
//
//  Created by Aileen Taboy on 11/14/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApartmentInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *proPertyName;
@property(nonatomic,strong)NSString *propertyString;


@property (weak, nonatomic) IBOutlet UITextField *LeaseLength;
@property(nonatomic,strong)NSString *leaseString;



- (IBAction)saveActionButton:(id)sender;


@end
