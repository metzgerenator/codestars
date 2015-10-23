//
//  SearchViewController.m
//  Travel Buddy
//

//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (nonatomic, strong) MKLocalSearch *localSearch;

//Define the portion of the map to display


@end

@implementation SearchViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)searchButton:(id)sender {
    
    
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc]init];
    request.naturalLanguageQuery = self.searchTextField.text;
    
    self.searchTextField.text = @" ";
    
    //set the user region
    request.region = self.boundingRegion;
    
    //Create and initialize search object
    //    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error){
        
        //place search results in the array
        self.placeSearchStorage = [response mapItems];
        NSLog(@"%@", self.placeSearchStorage[0]);

        [self.tableView reloadData];
    
        
    };
    
    self.localSearch = [[MKLocalSearch alloc]initWithRequest:request];
    [self.localSearch startWithCompletionHandler:completionHandler];
    

    
    [self.view endEditing:YES];
}



#pragma mark  - UITableView Methods 

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.placeSearchStorage.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"currentPlace";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    MKMapItem *mapitem = [self.placeSearchStorage objectAtIndex:indexPath.row];
    cell.textLabel.text = mapitem.name;
    
    
    return cell;
    
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MapViewController *mapViewController = segue.destinationViewController;
    
    MKCoordinateRegion region = self.boundingRegion;
    
    if ([segue.identifier isEqualToString:@"map"]) {
        NSIndexPath *selectedItemPath = [self.tableView indexPathForSelectedRow];
        MKMapItem *mapItem = self.placeSearchStorage [selectedItemPath.row];
        
        //determine where the map will zoom into
//        MKCoordinateRegion region = self.boundingRegion;
        region.center = mapItem.placemark.coordinate;
        mapViewController.boundingRegion = region;
        mapViewController.mapItemList = self.placeSearchStorage;
       
    
        
    } else if ([segue.identifier isEqualToString:@"all"]){
    
        
        mapViewController.boundingRegion = self.boundingRegion;
        mapViewController.mapItemList = self.placeSearchStorage;  
        
        
        
    }
    
}








@end
