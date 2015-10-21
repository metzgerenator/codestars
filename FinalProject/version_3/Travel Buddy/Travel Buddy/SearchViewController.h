//
//  SearchViewController.h
//  Travel Buddy

//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SearchViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>



@property (weak, nonatomic) IBOutlet UITextField *searchTextField;


//Array to store the MKMapItems in
@property (nonatomic, strong)NSArray *placeSearchStorage;
@property(nonatomic,strong)IBOutlet UITableView *tableView;



- (IBAction)searchButton:(id)sender;


@end
