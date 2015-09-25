//
//  CheckListTableViewController.h
//  travel_planner3
//
//  Created by Aileen Taboy on 9/24/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckListTableViewController : UITableViewController <UISearchResultsUpdating>

-(IBAction)undwindToList:(UIStoryboardSegue *)segue;

@end
