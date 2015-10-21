//
//  MapViewController.m
//  Travel Buddy
//

//

#import "MapViewController.h"
#import "MapViewAnnotation.h"


@interface MapViewController ()
@property (nonatomic, strong) MapViewAnnotation *annotation;


@end

@implementation MapViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    


  
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    
    for (MKMapItem *item in self.mapItemList) {
        MapViewAnnotation *point = [[MapViewAnnotation alloc]init];
        point.coordinate = item.placemark.location.coordinate;
        point.title = item.name;
        point.subtitle = item.phoneNumber;
        
        
        [self.mapView addAnnotation:point];
        
//        NSLog(@" this test works %@", item);
        
//
    
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






//mkannotation customization?

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {
    NSLog(@"Failed to load the map: %@", error);
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *const kAnnotationReuseIdentifier = @"CPAnnotationView";
    
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:kAnnotationReuseIdentifier];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kAnnotationReuseIdentifier];
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoLight];
    }
    
    return annotationView;
}

-(void)button:(id)sender {
    NSLog(@"button pressed");
}


- (IBAction)cancelButton:(id)sender {
}
@end
