//
//  EditAmenitiesViewController.m
//  APT
//
//  Copyright © 2015 Mike. All rights reserved.
//

#import "EditAmenitiesViewController.h"
#import "EditAmenitiesTableViewCell.h"

@interface EditAmenitiesViewController (){
    NSArray *amenitiesArray;
}

@end

@implementation EditAmenitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self queryParseMethod];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)queryParseMethod {
    PFQuery *query = [PFQuery queryWithClassName:@"amenities"];
    
    
    [query whereKeyExists:@"unitAmenities"];
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            amenitiesArray = [[NSArray alloc]initWithArray:objects];
            
            
            [self.tableView reloadData];
        }
    }];
    
    
}





#pragma mark - Table view data source



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return amenitiesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    EditAmenitiesTableViewCell *cell = (EditAmenitiesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    cell.amenityLabel.text
    
    PFObject *amenityObject = [amenitiesArray objectAtIndex:indexPath.row];
    
    NSString *amenityString = [amenityObject objectForKey:@"unitAmenities"];
    cell.amenityLabel.text = amenityString;
    
    
    
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // need to recognize switch   
    
    
}




#pragma mark - step controllers

- (IBAction)stepControllerBedrooms:(UIStepper *)sender {
    
    double value = sender.value;
    
    [self.numberOfBedrooms setText:[NSString stringWithFormat:@"%d", (int)value]];
    NSLog(@"%@", sender);
    
    
}
- (IBAction)stepControllerBathrooms:(UIStepper *)sender {
    
     double value = sender.value;
    
    [self.numberOfBathrooms setText:[NSString stringWithFormat:@"%d", (int)value]];
    NSLog(@"%@", sender);
    
}

#pragma mark - Save To Parse

- (IBAction)saveToParse:(id)sender {
    
    // Save to Parse
    
    NSString *bedroomNumber = self.numberOfBedrooms.text ;
    NSString *bathRoomNumber = self.numberOfBathrooms.text;
    
    
    PFObject *amenities  = self.currentPFObject;
    amenities.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
    
    [amenities setObject:bedroomNumber forKey:@"numberOfBedrooms"];
    [amenities setObject:bathRoomNumber forKey:@"numberOfBathrooms"];
    
    //Upload to Parse
    [amenities saveInBackground];

    
    
}
@end
