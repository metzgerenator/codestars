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


@end

@implementation MapSearchViewController {
    NSArray *placeMarks;  
}

- (void)viewDidLoad {
    [super viewDidLoad];
   

    // Do any additional setup after loading the view.
}



#pragma mark - viewcontroller appear & disappear

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CLLocationManager *locatonManager = [[CLLocationManager alloc]init];
    [locatonManager requestAlwaysAuthorization];
    self.mapView.showsUserLocation = YES;


    //This activates the zoom function
    [self.mapView setRegion:self.boundingRegion animated:YES];
    
    if (placeMarks > 0) {
        
        
        
        for (MKMapItem *item in placeMarks) {
            
            //determine where the map will zoom into®
           

           
            
            
            
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
