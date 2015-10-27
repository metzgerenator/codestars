//
//  SearchViewController.h
//  Travel Buddy

//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapViewController.h"

@interface SearchViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>


//for defining portion to display on map
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;


@property (weak, nonatomic) IBOutlet UITextField *searchTextField;


//Array to store the MKMapItems in
@property (nonatomic, strong)NSArray *placeSearchStorage;
@property(nonatomic,strong)IBOutlet UITableView *tableView;



- (IBAction)searchButton:(id)sender;


@end
