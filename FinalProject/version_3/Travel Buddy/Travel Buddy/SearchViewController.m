//
//  SearchViewController.m
//  Travel Buddy
//

//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (nonatomic, strong) MKLocalSearch *localSearch;

//Define the portion of the map to display
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;


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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)searchButton:(id)sender {
    
    
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc]init];
    request.naturalLanguageQuery = self.searchTextField.text;
    
    //set the user region
    request.region = self.boundingRegion;
    
    //Create and initialize search object
    //    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error){
        
        //place search results in the array
        self.placeSearchStorage = [response mapItems];
        NSLog(@"%@", self.placeSearchStorage[0]);

        
        //load our two viewdidload methods
//        [self viewDidDisappear:YES];
//        [self viewDidAppear:YES];
    //reload the table view data
        
        
//        SearchViewController *datasource = [[SearchViewController alloc]init];
//        [datasource setTableView:self.tableView];
//        [self.tableView setDelegate:self];
//        [self.tableView setDataSource:datasource];

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









@end
