//
//  MapViewController.m
//  Travel Buddy
//

//

#import "MapViewController.h"
#import "MapViewAnnotation.h"


@interface MapViewController ()
@property (nonatomic, strong) MKLocalSearch *localSearch;
@property (nonatomic, strong) MapViewAnnotation *annotation;


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
        

    }
    }

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
    
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error){
        
    //place search results in the array
        placeMarks = [response mapItems];
        

    //load our two viewdidload methods
        [self viewDidDisappear:YES];
        [self viewDidAppear:YES];
        
    };
    
    self.localSearch = [[MKLocalSearch alloc]initWithRequest:request];
    [self.localSearch startWithCompletionHandler:completionHandler];
    
    
    //Remove the keyboard after editing
    
    [self.view endEditing:YES];
    
}

//mkannotation customization?

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {
    NSLog(@"Failed to load the map: %@", error);
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *const kAnnotationReuseIdentifier = @"CPAnnotationView";
    
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:kAnnotationReuseIdentifier];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kAnnotationReuseIdentifier];
//        annotationView.animatesDrop = YES;
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
//        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoLight];
        
        UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [saveButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        annotationView.rightCalloutAccessoryView = saveButton;
    
        
    
    }
    
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
