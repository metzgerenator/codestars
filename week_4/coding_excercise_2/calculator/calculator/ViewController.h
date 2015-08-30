//
//  ViewController.h
//  calculator




#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *readout;



-(IBAction)numberReader:(UIButton*)button;

-(IBAction)addition:(UIButton *)input;
-(IBAction)subtraction:(UIButton *)input;
-(IBAction)multiplication:(UIButton *)input;
-(IBAction)division:(UIButton *)input;



-(IBAction)clearButton:(UIButton *)input;




-(IBAction)enter:(UIButton *)input;













@end

