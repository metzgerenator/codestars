//
//  MapViewController.m
//  Travel Buddy
//

//

#import "MapViewController.h"
#import "MapViewAnnotation.h"


@interface MapViewController ()

@end

@implementation MapViewController{
    NSMutableArray *placeMarks;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   


  
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    for (MKMapItem *item in placeMarks) {
        MapViewAnnotation *point = [[MapViewAnnotation alloc]init];
        point.coordinate = item.placemark.location.coordinate;
        point.title = item.name;
        point.subtitle = item.phoneNumber;
        
        [self.mapView addAnnotation:point];
        
        NSLog(@" this test works %@", item);
        
//
    }
//    [self.mapView addAnnotations:placeMarks];
//    [self.mapView showAnnotations:placeMarks animated:YES];
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
        for (MKMapItem *item in response.mapItems){
            [placeMarks addObject:item];
            
        }
//
        
//        placeMarks = [response mapItems];
//        placeMarks = [[NSMutableDictionary alloc]init];
        
//        for (MKMapItem *item in response.mapItems) {
////
//            MapViewAnnotation *point = [[MapViewAnnotation alloc]init];
//            
//            
//            point.coordinate = item.placemark.location.coordinate;
//            point.title = item.name;
//            point.subtitle = item.phoneNumber;
//            
//            [self.mapView addAnnotation:point];
//            	
//            [placeMarks addObject:point];
//        
        
//            UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//            [advertButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
//            
    
           

//        }
//
//        [self.mapView removeAnnotations:[self.mapView annotations]];
//        
//        [self.mapView showAnnotations:placeMarks animated:YES];
    }];
    
    [self.view endEditing:YES];
}

//mkannotation customization?

//- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
//    if (self)
//    {
//        // Set the frame size to the appropriate values.
//        CGRect  myFrame = self.frame;
//        myFrame.size.width = 40;
//        myFrame.size.height = 40;
//        self.frame = myFrame;
//        
//        // The opaque property is YES by default. Setting it to
//        // NO allows map content to show through any unrendered parts of your view.
//        self.opaque = NO;
//    }
//    return self;
//}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *reuseId = @"MapViewController";
    
   MKAnnotationView *pinView =[mapView dequeueReusableAnnotationViewWithIdentifier:reuseId];

    
        pinView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:reuseId];
        
        pinView.canShowCallout = YES;
    
        UIImageView *iconIMage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 46, 46)];
        pinView.leftCalloutAccessoryView = iconIMage;
        
        
        UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [advertButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        
        pinView.rightCalloutAccessoryView = advertButton;
    
   
    pinView.annotation = annotation;
   
    
    

    
    return pinView;
}

-(void)button:(id)sender {
    NSLog(@"button pressed");
}

- (IBAction)userLocation:(id)sender {
    
//    self.mapView.showsUserLocation = YES;
    [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
}
@end
