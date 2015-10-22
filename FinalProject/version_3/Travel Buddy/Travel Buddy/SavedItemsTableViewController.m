//
//  SavedItemsTableViewController.m
//  Travel Buddy
//

//

#import "SavedItemsTableViewController.h"
#import "SavedMapViewController.h"
#import <MapKit/MapKit.h>

#import <Parse/Parse.h>

@interface SavedItemsTableViewController ()
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;
@property (nonatomic, strong) NSArray *parsePlaceStorage;
@property (weak, nonatomic) PFObject *mapholder;

@end

@implementation SavedItemsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
        self.parseClassName = @"savedPlaces";
        
        //the key of the PFObject to display in the label of the default cell style
        self.textKey = @"title";
        
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
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    
    cell.textLabel.text = [object objectForKey:@"title"];
    
    
    
    return cell;  
    
}


//
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    SavedMapViewController *mapViewController = segue.destinationViewController;
//    MKCoordinateRegion region = self.boundingRegion;
//    
//    
//    if ([segue.identifier isEqual:@"savedMap"]) {
//        NSIndexPath *selectedItemPath = [self.tableView indexPathForSelectedRow];
//        PFObject *object = [self.objects objectAtIndex:selectedItemPath.row];
//        MKMapItem *mapitem = [object objectForKey:@"location"];
//        NSString* name = [object objectForKey:@"title"];
//        NSLog(@"Mapitem is %@, %@", mapitem, name);
//        
//        
////        mapitem = self.parsePlaceStorage[selectedItemPath.row];
//        self.mapholder = mapitem;
////        mapitem = self.mapholder;
//        NSLog(@"mapitem is now %@", self.mapholder);
//        region.center = mapitem.placemark.coordinate;
//        
//        
//        mapViewController.boundingRegion = region;
//        mapViewController.savedMapFromParseSegue = mapitem;
//        
//        
//
//    }
//    
//}


//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    SavedMapViewController *mapViewController = segue.destinationViewController;
//    MKCoordinateRegion region = self.boundingRegion;
//    
//    
//    if ([segue.identifier isEqual:@"savedMap"]) {
//        NSIndexPath *selectedItemPath = [self.tableView indexPathForSelectedRow];
//        PFObject *object = [self.objects objectAtIndex:selectedItemPath.row];
//        PFGeoPoint *mapitem = [object objectForKey:@"location"];
//    
//        NSLog(@"Mapitem is %@" mapitem);
//        
//        
//        //        mapitem = self.parsePlaceStorage[selectedItemPath.row];
//        self.mapholder = mapitem;
//        //        mapitem = self.mapholder;
//        NSLog(@"mapitem is now %@", self.mapholder);
//        region.center = mapitem.placemark.coordinate;
//        
//        
//        mapViewController.boundingRegion = region;
//        mapViewController.savedMapFromParseSegue = mapitem;
//        
//        
//        
//    }
//    
//}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Check that a new transition has been requested to the DetailViewController and prepares for it
//    if ([segue.identifier isEqualToString:@"displayDetailfromList"]){
//        
//        // Capture the object (e.g. exam) the user has selected from the list
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        PFObject *object = [self.objects objectAtIndex:indexPath.row];
//        
//        // Set destination view controller to DetailViewController to avoid the NavigationViewController in the middle (if you have it embedded into a navigation controller, if not ignore that part)
//        UINavigationController *nav = [segue destinationViewController];
//        SavedMapViewController *detailViewController = [segue destinationViewController];
//        detailViewController.self.mapView = object;
//    }
//}























@end
