//
//  SavedItemsTableViewController.m
//  Travel Buddy
//

//

#import "SavedItemsTableViewController.h"
#import "SavedMapViewController.h"
#import "MapViewAnnotation.h"
#import <MapKit/MapKit.h>

#import <Parse/Parse.h>

@interface SavedItemsTableViewController ()
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;
//@property (nonatomic, strong) NSArray *parsePlaceStorage;
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








-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SavedMapViewController *mapViewController = segue.destinationViewController;
    MKCoordinateRegion region = self.boundingRegion;
    
    
    if ([segue.identifier isEqual:@"savedMap"]) {
        NSIndexPath *selectedItemPath = [self.tableView indexPathForSelectedRow];
        PFObject *object = [self.objects objectAtIndex:selectedItemPath.row];
        NSLog(@"pfobject is now %@", object);
        
        self.mapholder = object;
        mapViewController.savedMapFromParseSegue = object;
        
        NSLog(@"mapholder object is = %@", self.mapholder);

        
        PFGeoPoint *forCoordinate = [object objectForKey:@"location"];
        float coordinateLongitutde = forCoordinate.longitude;
        float coordinateLatitude = forCoordinate.latitude;

        region.center.latitude = forCoordinate.latitude;
        region.center.longitude = forCoordinate.longitude;
        MKCoordinateRegion region  = { {0.0, 0.0 }, { 0.0, 0.0 } };
        region.center.longitude = coordinateLongitutde;
        region.center.latitude = coordinateLatitude;

        mapViewController.boundingRegion = region;
//        mapViewController.savedMapFromParseSegue = point;
        
        

    }
    
}




























@end
