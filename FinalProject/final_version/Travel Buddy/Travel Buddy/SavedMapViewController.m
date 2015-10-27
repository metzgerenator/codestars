//
//  SavedMapViewController.m
//  Travel Buddy
//

//

#import "SavedMapViewController.h"


@interface SavedMapViewController ()

@end

@implementation SavedMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.mapView setRegion:self.boundingRegion animated:YES];  

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    //retrived PFGeoPoint from segue

    PFGeoPoint *forCoordinate = [self.savedMapFromParseSegue objectForKey:@"location"];
    
    float coordinateLongitutde = forCoordinate.longitude;
    float coordinateLatitude = forCoordinate.latitude;
    
    
    //Create MK Coordinate Region
    MKCoordinateRegion region  = { {0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.longitude = coordinateLongitutde;
    region.center.latitude = coordinateLatitude;
    
    //get name from PFGeoPoint
    NSString* name = [self.savedMapFromParseSegue objectForKey:@"title"];

   //create annotation and set it
        MapViewAnnotation *point = [[MapViewAnnotation alloc]init];
        point.coordinate = region.center;
        point.title = name;
        [self.mapView addAnnotation:point];

        
    

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
