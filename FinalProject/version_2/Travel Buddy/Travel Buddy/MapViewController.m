//
//  MapViewController.m
//  Travel Buddy
//

//

#import "MapViewController.h"
#import "MapViewAnnotation.h"


@interface MapViewController ()
@property (nonatomic, strong) MKLocalSearch *localSearch;

@end

@implementation MapViewController{
    NSArray *placeMarks;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   


  
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (placeMarks > 0) {
        
    
    
    for (MKMapItem *item in placeMarks) {
        MapViewAnnotation *point = [[MapViewAnnotation alloc]init];
        point.coordinate = item.placemark.location.coordinate;
        point.title = item.name;
        point.subtitle = item.phoneNumber;
        
        [self.mapView addAnnotation:point];
        
        NSLog(@" this test works %@", item);
        
//
    }
    }
//    [self.mapView addAnnotations:placeMarks];
//    [self.mapView showAnnotations:placeMarks animated:YES];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.mapView removeAnnotations:self.mapView.annotations];
    
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
    request.region = self.mapView.region;
    
    //Create and initialize search object
//    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error){
        placeMarks = [response mapItems];
        
//        for (MKMapItem *item in response.mapItems) {
//            [placeMarks addObject:item];
//            NSLog(@"adding item to index %@", item);
//            [self.mapView showAnnotations:placeMarks animated:YES];
//        }
        [self viewDidDisappear:YES];
        [self viewDidAppear:YES];
        
    };
    
    self.localSearch = [[MKLocalSearch alloc]initWithRequest:request];
    [self.localSearch startWithCompletionHandler:completionHandler];
    //Start the search and display annotation on the map
    
    
    
    [self.view endEditing:YES];
    
}

//mkannotation customization?

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {
    NSLog(@"Failed to load the map: %@", error);
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
    
    annotationView.animatesDrop = YES;
    annotationView.canShowCallout = YES;
    
    UIImageView *myCustomImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images.png"]];
    annotationView.leftCalloutAccessoryView = myCustomImage;
    
    
    return annotationView;
}

-(void)button:(id)sender {
    NSLog(@"button pressed");
}

- (IBAction)userLocation:(id)sender {
    
//    self.mapView.showsUserLocation = YES;
    [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
}
@end
