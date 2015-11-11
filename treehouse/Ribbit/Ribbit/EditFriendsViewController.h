//
//  EditFriendsViewController.h
//  Ribbit
//
//  Created by Aileen Taboy on 11/10/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendsViewController : UITableViewController


@property (nonatomic, strong)NSArray *allUsers;
@property (nonatomic, strong)PFUser *currentUser;
@property(nonatomic, strong)NSMutableArray *friends;



-(BOOL)isFriend:(PFUser *)user;


@end
