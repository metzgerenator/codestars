//
//  ViewController.m
//  calculator


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// check


{
    NSNumber *number1;
    NSNumber * total;
    NSNumber *clearScreen;
    

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(IBAction)numberReader:(UIButton*)button{
    if (clearScreen != nil) {
        self.readout.text = @"0";
        clearScreen = nil;
    } else {
    
    ///take UIButton and convert to string
    NSString *buttonHit = [button   currentTitle];
    
    NSString *currentDisplaytext = self.readout.text;
    
    //append the next UIButton action to what is currently displayed
    NSString *combinedString = [currentDisplaytext stringByAppendingString:buttonHit];
    
    //set display equal to combinedString
    self.readout.text = combinedString;
    float forTotal = [combinedString floatValue];
    number1 = [[NSNumber alloc]initWithFloat:forTotal];
        NSLog(@"adding %@ to number1", number1); }
    
   
}



-(IBAction)addition:(UIButton *)functionButton{
    self.readout.text = @"0";
    float newtotal = [number1 floatValue] + [total floatValue];
    total = [[NSNumber alloc]initWithFloat:newtotal];
    number1 = nil;
    NSLog(@" total is  now %@", total);
    
    
}


-(IBAction)subtraction:(UIButton *)input{
    
    self.readout.text = @"0";
  float newtotal = [number1 floatValue] - [total floatValue];
    total = [[NSNumber alloc]initWithFloat:newtotal];
    number1 = nil;
        NSLog(@" total is  now %@", total);
    
}

-(IBAction)multiplication:(UIButton *)input{
    if (total == nil) {
        total = @1;
    }
   
    self.readout.text = @"0";
    float newtotal = [number1 floatValue] * [total floatValue];
    total = [[NSNumber alloc]initWithFloat:newtotal];
    number1 = nil;
        NSLog(@" total is  now %@", total);
    
}

-(IBAction)division:(UIButton *)input{
    if (total == nil) {
        total = @1;
    }
    
    self.readout.text = @"0";
    float newtotal = [number1 floatValue] / [total floatValue];
    total = [[NSNumber alloc]initWithFloat:newtotal];
    number1 = nil;
    NSLog(@" total is  now %@", total);
    
    
}



-(IBAction)clearButton:(UIButton *)input{
    self.readout.text = @"0";
    total = nil;
    
}



-(IBAction)enter:(UIButton *)input{
    self.readout.text = [[NSString alloc]initWithFormat:@"%@",total];
    clearScreen = @1;
    
}












@end
