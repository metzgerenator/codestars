//
//  AddToPackingListTableViewController.h
//  Travel Buddy
//
//  Created by Michael Metzger  on 10/17/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddToPackingListTableViewController : UITableViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *itemPicture;


@property (weak, nonatomic) IBOutlet UITextField *addItemField;

@property (weak, nonatomic) IBOutlet UILabel *placeHolderLabel;

- (IBAction)saveItemButton:(id)sender;

@end
