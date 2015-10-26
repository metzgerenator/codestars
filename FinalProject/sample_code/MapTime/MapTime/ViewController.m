//
//  ViewController.m
//  MapTime
//
//  Created by Michael Metzger  on 10/24/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import "ViewController.h"
#import "MapViewAnnotation.h"

@interface ViewController () {
    NSArray *placeMarks;  
}
@property (nonatomic, strong) MKLocalSearch *localSearch;
@property (nonatomic, strong) MapViewAnnotation *annotation;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"app is starting 1");
}


- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
        for (MKMapItem *item in placeMarks) {
            MapViewAnnotation *point = [[MapViewAnnotation alloc]init];
            point.coordinate = item.placemark.location.coordinate;
            point.title = item.name;
            point.subtitle = item.phoneNumber;
            
            
            [self.MapView addAnnotation:point];
            
          
        }
    
    
}


-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.MapView removeAnnotations:self.MapView.annotations];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButton:(id)sender {
    
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc]init];
    request.naturalLanguageQuery = self.searchTextField.text;
    
    //set the user region
    request.region = self.MapView.region;
    
    //Create and initialize search object
    
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error){
        
        //place search results in the array
        placeMarks = [response mapItems];
        
        
        //load our two viewdidload methods
        [self viewDidDisappear:YES];
        [self viewDidAppear:YES];
        
        NSLog(@"search is happening now 3");
        
    };
    
    self.localSearch = [[MKLocalSearch alloc]initWithRequest:request];
    [self.localSearch startWithCompletionHandler:completionHandler];
    NSLog(@"search is starting  2");
    
    //Remove the keyboard after editing
    
    [self.view endEditing:YES];
    

}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *const kAnnotationReuseIdentifier = @"CPAnnotationView";
    
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:kAnnotationReuseIdentifier];


    if (annotationView == nil) {
        
        
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kAnnotationReuseIdentifier];
    
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        
        
        UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [saveButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        annotationView.rightCalloutAccessoryView = saveButton;

        
        
        
    }
    
    return annotationView;
}


-(void)button:(id)sender {
    NSLog(@"button pressed");
}
















@end
