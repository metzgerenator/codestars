//
//  PackingListTableViewController.m
//  Travel Buddy
//

//

#import "PackingListTableViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/PFImageView.h>

@interface PackingListTableViewController ()

@end

@implementation PackingListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        
        NSLog(@"The Current User is %@",currentUser.username);

    }else {
        
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshTable:)
                                                 name:@"refreshTable"
                                               object:nil];
    
    
}



-(void)refreshTable: (NSNotification*) notification
{
    [self loadObjects];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    
    if (self) {
        //The className to query on
        self.parseClassName = @"itemsToPack";
        
        //the key of the PFObject to display in the label of the default cell style
        self.textKey = @"item";
        
        //Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        //Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
    }
    return self;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:
(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    PFObject *object = [self.objects objectAtIndex:indexPath.row];
    [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self refreshTable:nil];
    }];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(nullable PFObject *)object {
    
    static NSString *CellIdentifier = @"Cell";
    
    PackingListTableViewCell *cell = (PackingListTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    PFFile *thumbnail = [object objectForKey:@"itemImage"];
    PFImageView *thumbnailImageView = (PFImageView*)cell.itemPictureCell;
    thumbnailImageView.image = [UIImage imageNamed:@"placeholder.jpg"];
    thumbnailImageView.file = thumbnail;
    [thumbnailImageView loadInBackground];
    
    cell.itemToPackLabel.text = [object objectForKey:@"item"];
    
    return cell;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLogin"]) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }
   
}


- (IBAction)logout:(id)sender {
    // Parse Logout Call
    
    [PFUser logOut];
    
    // Take the user back to the login segue
    
    [self performSegueWithIdentifier:@"showLogin" sender:self];   
    
}
@end
