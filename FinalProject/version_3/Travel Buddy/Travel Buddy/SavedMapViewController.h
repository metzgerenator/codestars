//
//  SavedMapViewController.h
//  Travel Buddy
//

//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>

@interface SavedMapViewController : UIViewController <MKAnnotation,CLLocationManagerDelegate,MKMapViewDelegate>

@property (nonatomic)CLLocationCoordinate2D coordinate;

//Need to fix bounding region
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;

@property (nonatomic, strong) PFGeoPoint *savedMapFromParseSegue;



@property (weak, nonatomic) IBOutlet MKMapView *mapView;



- (IBAction)backToSavedButton:(id)sender;

@end
