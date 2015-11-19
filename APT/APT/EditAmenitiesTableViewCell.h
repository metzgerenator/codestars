//
//  EditAmenitiesTableViewCell.h
//  APT
//
//  Created by Aileen Taboy on 11/18/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditAmenitiesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *amenityLabel;


- (IBAction)amenitySwitch:(id)sender;

@end
