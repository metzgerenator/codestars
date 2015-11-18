//
//  MapSearchViewController.m
//  APT
//
//  Created by Aileen Taboy on 11/17/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "MapSearchViewController.h"
#import "MapViewAnnotation.h"


@interface MapSearchViewController ()

@property (nonatomic, strong) MKLocalSearch *localSearch;
@property (nonatomic, strong) MapViewAnnotation *annotation;
@property (nonatomic) CLLocationManager *locationManager;


@end

@implementation MapSearchViewController {
    NSArray *placeMarks;  
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // Do any additional setup after loading the view.
}



#pragma mark - ask for user location

- (IBAction)userLocation:(id)sender {
    
    [self startLocationManager];  
}



-(void)startLocationManager{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone; //whenever we move
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager startUpdatingLocation];
    [self.locationManager requestWhenInUseAuthorization]; // Add This Line
    
    self.mapView.showsUserLocation = YES;
    
}

#pragma mark - setannotation location and zoom

-(void)annotationLocation {
    
    
    MKCoordinateRegion region = self.boundingRegion;
    MKMapPoint points[[placeMarks count]];
    
    for (int i = 0;i < placeMarks.count; i ++) {
        MKMapItem *mapItem = [placeMarks objectAtIndex:i];
        
        points[i] = MKMapPointForCoordinate(mapItem.placemark.coordinate);
    }
    
    MKPolygon *poly = [MKPolygon polygonWithPoints:points count:[placeMarks count]];
    
    MKMapRect rectForMap = [poly boundingMapRect];
    region = MKCoordinateRegionForMapRect(rectForMap);
    region = MKCoordinateRegionForMapRect(rectForMap);
    
    self.boundingRegion = region;
    region = [self.mapView regionThatFits:region];
    
    [self.mapView setRegion:self.boundingRegion animated:YES];

    
}



#pragma mark - mapView delagate methods

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    [self.mapView setRegion:MKCoordinateRegionMake(userLocation.coordinate, MKCoordinateSpanMake(0.1f, 0.1f)) animated:YES];
}

#pragma mark - viewcontroller appear & disappear

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    
//    CLLocationManager *locatonManager = [[CLLocationManager alloc]init];
//    [locatonManager requestWhenInUseAuthorization];
//    self.mapView.showsUserLocation = YES;


    //This activates the zoom function

    if (placeMarks > 0) {
        
        
        
        for (MKMapItem *item in placeMarks) {
            
            
            //Set the annotation attributes
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


#pragma mark - search bottun pressed

- (IBAction)searchButton:(id)sender {
    
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc]init];
    request.naturalLanguageQuery = self.searchTextField.text;
    
    //set the user region
    request.region = self.mapView.region;
    
    //Create and initialize search object
    
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error){
        
        
        
        
        //place search results in the array
        placeMarks = [response mapItems];
        
        
        //setplaceMark Locations
        
        [self annotationLocation];
        
        
        //load our two viewdidload methods
        [self viewDidDisappear:YES];
        [self viewDidAppear:YES];
        
    };
    
    self.localSearch = [[MKLocalSearch alloc]initWithRequest:request];
    [self.localSearch startWithCompletionHandler:completionHandler];
    
    
    //Remove the keyboard after editing
    
    [self.view endEditing:YES];

    
    
    
    
}
@end
