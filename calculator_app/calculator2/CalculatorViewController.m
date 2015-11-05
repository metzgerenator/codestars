//
//  CalculatorViewController.m
//  calculator2
//
//

#import "CalculatorViewController.h"

@interface CalculatorViewController () {
    NSNumber *numberFromDisplay;
//    NSNumber *number1;
    
    NSString *lastActionTaken;
    
    
    BOOL takeAction;
    
    BOOL sreenNeedsToBecleared;
}



@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)numberInputAction:(id)numberInput {
    
    if (sreenNeedsToBecleared) {
        self.calculatorTextField.text = @" ";
    }
    
    
    NSString *inputString = [numberInput currentTitle];
    
    NSString *currentDisplay = self.calculatorTextField.text;
    
    
    NSString *forTextOutput = [currentDisplay stringByAppendingString:inputString];
    
    self.calculatorTextField.text = forTextOutput;
    
    //convert display to number
    
    double forDisplay = [self.calculatorTextField.text  floatValue];
    
    if (numberFromDisplay == NULL) {
        numberFromDisplay = [[NSNumber alloc]initWithFloat:forDisplay];
        
        NSLog(@"numberFromDisplay is now %@", numberFromDisplay);
    
    }
    
   
    
    
    
    
}

- (IBAction)clearActionButton:(id)sender {
    
    self.calculatorTextField.text = @" ";
    numberFromDisplay = NULL;

  
    

}

- (IBAction)divideActionButton:(id)sender {
    
}

- (IBAction)multiplicationActionButton:(id)sender {
}

- (IBAction)subTractionActionButton:(id)sender {
}

- (IBAction)additionActionButton:(id)sender {
    
    //if this is the first digit in, then
    if (!takeAction) {
        NSLog(@"takeaction false, changing to true");
        
        takeAction = YES;

    } else if (takeAction){
      

        
        takeAction = NO;
    
        
    }
    
    
    self.calculatorTextField.text = @" ";
    
    
}

- (IBAction)equalsActionButton:(id)sender {
    
    
    
    NSString *forDisplay = [numberFromDisplay stringValue];
    
    self.calculatorTextField.text = forDisplay;
    
    
    //Notify the
     sreenNeedsToBecleared = YES;
}
@end
