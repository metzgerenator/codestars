//
//  MapViewController.m
//  Travel Buddy
//

//

#import "MapViewController.h"
#import "MapViewAnnotation.h"
#import "SearchViewController.h"


@interface MapViewController ()
@property (nonatomic, strong) MapViewAnnotation *annotation;


@end

@implementation MapViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    [self.mapView setRegion:self.boundingRegion animated:YES];


  
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    for (MKMapItem *item in self.mapItemList) {
        
    
    
//        MKMapItem *item  = [self.mapItemList objectAtIndex:0];
   
        MapViewAnnotation *point = [[MapViewAnnotation alloc]init];
        point.coordinate = item.placemark.location.coordinate;
        point.title = item.name;
        point.subtitle = item.phoneNumber;
        
        
        [self.mapView addAnnotation:point];
//    [self.mapView selectAnnotation:[self.mapView.annotations objectAtIndex:0] animated:YES];
//        [self.mapView selectAnnotation:point animated:YES];
    }
    
        
//
    
    
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


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // reuse pin annotation
    static NSString *viewId = @"MKPinAnnotationView";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView*)
    [self.mapView dequeueReusableAnnotationViewWithIdentifier:viewId];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc]
                           initWithAnnotation:annotation reuseIdentifier:viewId];
    }
    
    
    // create a button for callout
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [saveButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    //changes to standard annotation
    annotationView.rightCalloutAccessoryView = saveButton;
    annotationView.animatesDrop = YES;
    annotationView.canShowCallout = YES;
    
    
    NSLog(@"annotation view is working");
    return annotationView;
}


-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    
    NSLog(@" %@", control);
    
}

-(void)button:(id)sender {
//    NSLog(@"button pressed %@", sender);
}





#pragma mark - cancelButton

- (IBAction)cancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}
@end
