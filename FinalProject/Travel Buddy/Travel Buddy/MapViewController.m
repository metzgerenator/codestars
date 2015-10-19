//
//  MapViewController.m
//  Travel Buddy
//

//

#import "MapViewController.h"


@interface MapViewController ()

@end

@implementation MapViewController{
    NSMutableArray *placeMarks;
}

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
    request.region = self.mapView.region;
    
    //Create and initialize search object
    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    
    
    //Start the search and display annotation on the map
    [search startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable response, NSError * _Nullable error) {
         placeMarks = [NSMutableArray array];
        
//        placeMarks = [response mapItems];
//        placeMarks = [[NSMutableDictionary alloc]init];
        
        for (MKMapItem *item in response.mapItems) {
            
            MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
            point.coordinate = item.placemark.location.coordinate;
            point.title = item.name;
            point.subtitle = item.phoneNumber;
            //need to convert placemark to a string for subtitle
            
            // need to add callout
            
//            [self.mapView addAnnotation:point];
            
            [placeMarks addObject:point];

//            [placeMarks addObject:item.placemark];
           
//
        }
        
        [self.mapView removeAnnotations:[self.mapView annotations]];
        
        [self.mapView showAnnotations:placeMarks animated:YES];
    }];
  
    
}

//mkannotation customization?   

//-(MKAnnotationView*)mapView:(MKMapView *) mapView viewForAnnotation:(nonnull id<MKAnnotation>)annotation
//{
//    
//    MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];
//    
//    view.image = [UIImage imageNamed:@"images.png"];
//    
//    return view;
//}

- (IBAction)userLocation:(id)sender {
    
//    self.mapView.showsUserLocation = YES;
    [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
}
@end
