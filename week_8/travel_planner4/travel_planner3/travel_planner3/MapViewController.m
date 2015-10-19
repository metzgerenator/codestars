//
//  MapViewController.m
//  travel_planner3
//

//

#import "MapViewController.h"

#define METERS_PER_MILE 1609.344

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    // my location
    //40.761586, -73.962525
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.761586;
    zoomLocation.longitude = -73.962525;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5 * METERS_PER_MILE, 0.5 * METERS_PER_MILE);
    
    [_mapView setRegion:viewRegion animated:YES];
    
    
    
    //Map Cordinates
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D locationOne;
    locationOne.latitude = 40.760121;
    locationOne.longitude = -73.965513;
    point.coordinate = locationOne;
    point.title = @"Good Food Here";
    point.subtitle = @"Indian";
    [self.mapView addAnnotation:point];
    
    
   
    
    MKPointAnnotation *point2 = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D locationTwo;
    locationTwo.latitude = 40.761704;
    locationTwo.longitude = -73.962673;
    point2.coordinate = locationTwo;
    point2.title = @"A Nice Place";
    point2.subtitle = @"Inhabited by a famous person";
    [self.mapView addAnnotation:point2];
    
    
    MKPointAnnotation *point3 = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D locationThree;
    locationThree.latitude = 40.761097;
    locationThree.longitude = -73.964290;
    point3.coordinate = locationThree;
    point3.title = @"Tram";
    point3.subtitle = @"Manhattan Side to R Island";
    [self.mapView addAnnotation:point3];
    
    
    
  
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
