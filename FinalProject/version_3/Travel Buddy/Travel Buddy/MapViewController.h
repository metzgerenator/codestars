//
//  MapViewController.h
//  Travel Buddy



#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface MapViewController : UIViewController <MKAnnotation,CLLocationManagerDelegate,MKMapViewDelegate>

@property (nonatomic)CLLocationCoordinate2D coordinate;

//Need to fix bounding region 
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;

@property (nonatomic, strong) NSArray *mapItemList;




@property (strong, nonatomic) IBOutlet MKMapView *mapView;


- (IBAction)cancelButton:(id)sender;




@end
