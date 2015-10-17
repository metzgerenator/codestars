//
//  AddItemTableViewController.h
//  Travel Buddy
//
//  Created by Aileen Taboy on 10/16/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI/PFQueryTableViewController.h>
#import "AddItemTableViewController.h"
#import "PackingListTableViewCell.h"

@interface AddItemTableViewController :PFQueryTableViewController


@property (weak, nonatomic) IBOutlet UIImageView *pictureOutlet;

@property (weak, nonatomic) IBOutlet UITextField *itemInputField;


@end
