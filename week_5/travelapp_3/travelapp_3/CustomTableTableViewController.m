//
//  CustomTableTableViewController.m
//  travelapp_3
//
//  Created by Aileen Taboy on 9/8/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "CustomTableTableViewController.h"
#import "DetailViewController.h"

@interface CustomTableTableViewController ()

@end

@implementation CustomTableTableViewController
{
    NSArray *destinations;
    NSArray *destinationImages;
    NSArray *descriptions;
    NSArray *destPictures;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
    
    destinations = @[@"Arizona", @"Japan", @"NewYork"];
    descriptions = @[@"Arizona, a southwestern U.S. state, is best known for its reliably sunny weather and as home to the the Grand Canyon, the mile-deep chasm carved by the Colorado River.",
                     @"Japan is an island nation in the Pacific Ocean with high-rise-filled cities, imperial palaces, mountainous national parks and thousands of shrines and temples",
                     @"Home to the Empire State Building, Times Square, Statue of Liberty and other iconic sites, New York City is a fast-paced, globally influential center of art, culture, fashion and finance."];
    destPictures = @[@"arizona.jpg", @"japan.jpg",@"newyork.jpg"];
    
    
    
    
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [destinations count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.textLabel.text = [destinations objectAtIndex:indexPath.row];
    
    
        cell.imageView.image = [UIImage imageNamed:[destPictures objectAtIndex:indexPath.row]];
    
    
    
    return cell;
}






- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"destinationDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *destViewController = segue.destinationViewController;
        destViewController.destinationName = [destinations objectAtIndex:indexPath.row];
        destViewController.descriptionName = [descriptions objectAtIndex:indexPath.row];
        destViewController.imagedescription = [UIImage imageNamed:[destPictures objectAtIndex:indexPath.row]];


    }
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
