//
//  MapSearchViewController.h
//  APT
//
//  Created by Aileen Taboy on 11/17/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapSearchViewController : UIViewController <MKAnnotation,CLLocationManagerDelegate,MKMapViewDelegate>

@property (nonatomic)CLLocationCoordinate2D coordinate;



@property (weak, nonatomic) IBOutlet MKMapView *mapView;

//Add search text field 
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;


- (IBAction)searchButton:(id)sender;

@end
