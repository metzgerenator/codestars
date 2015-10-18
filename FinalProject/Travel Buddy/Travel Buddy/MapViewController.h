//
//  MapViewController.h
//  Travel Buddy
//
//  Created by Aileen Taboy on 10/18/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)searchButton:(id)sender;

@end
