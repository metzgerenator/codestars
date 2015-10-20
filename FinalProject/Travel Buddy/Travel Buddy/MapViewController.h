//
//  MapViewController.h
//  Travel Buddy



#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface MapViewController : UIViewController <MKAnnotation,CLLocationManagerDelegate,MKMapViewDelegate>
@property (nonatomic)CLLocationCoordinate2D coordinate;




@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)searchButton:(id)sender;
- (IBAction)userLocation:(id)sender;

@end
