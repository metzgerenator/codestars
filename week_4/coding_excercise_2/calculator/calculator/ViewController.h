//
//  ViewController.h
//  calculator




#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel *readout;



-(IBAction)numberReader:(UIButton*)button;

-(IBAction)clearButton:(UIButton *)clear;





@end

