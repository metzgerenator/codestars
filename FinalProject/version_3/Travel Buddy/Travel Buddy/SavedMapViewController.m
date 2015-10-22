//
//  SavedMapViewController.m
//  Travel Buddy
//

//

#import "SavedMapViewController.h"
#import "MapViewAnnotation.h"

@interface SavedMapViewController ()

@end

@implementation SavedMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

//       PFGeoPoint *item = self.savedMapFromParseSegue;
//    MKMapItem *newMapItem = [[MKMapItem alloc]init];
//    
//        MapViewAnnotation *point = [[MapViewAnnotation alloc]init];
//        point.coordinate = .placemark.location.coordinate;
//        point.title = newMapItem.name;
//        point.subtitle = newMapItem.phoneNumber;
//        [self.mapView addAnnotation:point];

        
    

}


-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.mapView removeAnnotations:self.mapView.annotations];
    
}

// add annotation method 




- (IBAction)backToSavedButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
