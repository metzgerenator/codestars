//
//  ViewController.h
//  MapTime
//
//  Created by Michael Metzger  on 10/24/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController  <MKAnnotation,MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *MapView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
- (IBAction)searchButton:(id)sender;

@end

