//
//  CalculatorViewController.h
//  calculator2
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *calculatorTextField;



- (IBAction)numberInputAction:(id)numberInput;






- (IBAction)clearActionButton:(id)sender;

- (IBAction)divideActionButton:(id)sender;

- (IBAction)multiplicationActionButton:(id)sender;

- (IBAction)subTractionActionButton:(id)sender;

- (IBAction)additionActionButton:(id)sender;

- (IBAction)equalsActionButton:(id)sender;








@end
