//
//  ViewController.m
//  calculator


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// check


{
//    NSNumber *currentDisplayFromAction1;
    NSNumber *number1;
    NSNumber *number2;
    NSNumber * total;
    

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clearButton:(UIButton *)clear{
    
    
    self.readout.text = @"0";
    number1 = nil;
    number2 = nil;
    total = nil;
    
}



-(IBAction)numberReader:(UIButton*)button{
    
    ///take UIButton and convert to string
    NSString *buttonHit = [button   currentTitle];
    
    NSLog(@" resetting display to %@", buttonHit);

    
    //check for operands
    if ([buttonHit isEqual:@"+"])
    {
     self.readout.text = @" ";
        NSLog(@" inputing x now %@", buttonHit);

    }
    
    
    //convert UILabel display to NSString for appending operation
    NSString *currentDisplaytext  =self.readout.text;
    
    //append the next UIButton action to what is currently displayed
    NSString *combinedString = [currentDisplaytext stringByAppendingString:buttonHit];

    
    //set display equal to combinedString
    self.readout.text = combinedString;
    
//    //convert combinedString to a Float
//    float totalButtonDisplayNumber = [combinedString floatValue];
//    
//    //conveert float to instance of NSNumber
//    NSNumber *numberForVariable = [NSNumber numberWithFloat:totalButtonDisplayNumber];
//    
//    //set ivar to total NSNumber conversion from display
//    currentDisplayFromAction1 = numberForVariable;

    
}


-(IBAction)functions:(UIButton *)functionInput{
    NSString* readOut =  self.readout.text;
    
    
    if (number1 == nil) {
        NSString *currentDisplay = self.readout.text;
        
        float numberInput1 = [currentDisplay floatValue];
        number1 = [[NSNumber alloc] initWithFloat:numberInput1];
        NSLog(@"setting number one to %@", number1);
       float totalInput  = [number1 floatValue] + [number2 floatValue];
        total = [[NSNumber alloc] initWithFloat:totalInput];
        NSLog(@"setting total to %@", total);
//        
        NSString *newDisplay = [NSString stringWithFormat:@"%.2f", totalInput];
        self.readout.text = newDisplay;
        
       
        NSLog(@"setting display to %@", newDisplay);

        
        
    } else  {
        //clear screen
        self.readout.text = @" ";
        
        float display = [readOut floatValue];
        number1 = nil;
        float newTotal = display + [total floatValue];
        NSLog(@" the total is now float %f", newTotal);
        
        //add display to total
        // set display to total
        
        
    }
    
 

    
    
    
    
    
    
    
}
















@end
