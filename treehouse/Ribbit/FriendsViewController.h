//
//  FriendsViewController.h
//  Ribbit
//
//  Created by Aileen Taboy on 11/10/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FriendsViewController : UITableViewController

@property(nonatomic, strong)PFRelation *friendsRelation;
@property(nonatomic, strong)NSArray *friends;  

@end
