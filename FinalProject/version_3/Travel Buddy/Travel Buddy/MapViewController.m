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
    
    //zoom in on where the annotations are placed
    [self.mapView setRegion:self.boundingRegion animated:YES];


  
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
        MKMapItem *item  = [self.mapItemList objectAtIndex:0];
   
        MapViewAnnotation *point = [[MapViewAnnotation alloc]init];
        point.coordinate = item.placemark.location.coordinate;
        point.title = item.name;
        point.subtitle = item.phoneNumber;
        
        
        [self.mapView addAnnotation:point];
    [self.mapView selectAnnotation:[self.mapView.annotations objectAtIndex:0] animated:YES];
        
    
        
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
    // this part is boilerplate code used to create or reuse a pin annotation
    static NSString *viewId = @"MKPinAnnotationView";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView*)
    [self.mapView dequeueReusableAnnotationViewWithIdentifier:viewId];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc]
                           initWithAnnotation:annotation reuseIdentifier:viewId];
    }
    // set your custom image
    annotationView.animatesDrop = YES;
    annotationView.canShowCallout = YES;
    NSLog(@"annotation view is working");  
    return annotationView;
}


-(void)button:(id)sender {
    NSLog(@"button pressed");
}



#pragma mark - cancelButton

- (IBAction)cancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}
@end
