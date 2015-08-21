//
//  ViewController.h
//  Appatempt2


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property(weak, nonatomic)IBOutlet UILabel *factGenerator;

-(IBAction)activityGenerator;


@end

