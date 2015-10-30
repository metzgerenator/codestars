//
//  SavedMapViewController.h
//  Travel Buddy
//

//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapViewAnnotation.h"
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>

@interface SavedMapViewController : UIViewController <MKAnnotation,CLLocationManagerDelegate,MKMapViewDelegate>

@property (nonatomic)CLLocationCoordinate2D coordinate;

@property (nonatomic, assign) MKCoordinateRegion boundingRegion;


// This is set by prepare for seque method
@property (nonatomic, strong) PFObject *savedMapFromParseSegue;

@property (nonatomic, strong) NSArray *savedObjectsFromParseSegue;  



@property (weak, nonatomic) IBOutlet MKMapView *mapView;



- (IBAction)backToSavedButton:(id)sender;

@end
