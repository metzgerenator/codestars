//
//  CheckListTableViewController.m
//  travel_planner3
//
//  Created by Aileen Taboy on 9/24/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "CheckListTableViewController.h"
#import "CheckList.h"
#import "AddCheckListItemViewController.h"

@interface CheckListTableViewController ()

@property NSMutableArray *checkListItems;

@end

@implementation CheckListTableViewController

-(void)loadInitialData {
    CheckList *item1 = [[CheckList alloc]init];
    item1.itemName = @"Test One";
    [self.checkListItems addObject:item1];
    
    CheckList *item2 = [[CheckList alloc]init];
    item1.itemName = @"Test Two";
    [self.checkListItems addObject:item2];
    
    CheckList *item3 = [[CheckList alloc]init];
    item1.itemName = @"Test Three";
    [self.checkListItems addObject:item3];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.checkListItems = [[NSMutableArray alloc]init];
    
    [self loadInitialData];  
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.checkListItems count];
}

-(IBAction)undwindToList:(UIStoryboardSegue *)segue{
    AddCheckListItemViewController *source = [segue sourceViewController];
    CheckList *item = source.checkListItem;
    if (item != nil) {
        [self.checkListItems addObject:item];
        [self.tableView reloadData];
    }

    
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    CheckList *checkListItem = [self.checkListItems objectAtIndex:indexPath.row];
    cell.textLabel.text = checkListItem.itemName;
    
    if (checkListItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    CheckList *tappedItem = [self.checkListItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
