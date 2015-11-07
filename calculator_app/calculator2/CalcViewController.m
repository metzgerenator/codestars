//
//  CalcViewController.m
//  calculator2
//
//  Created by Michael Metzger  on 11/4/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "CalcViewController.h"

@interface CalcViewController ()

{
    NSNumber * currentTotal;
    NSNumber * secondNumber;
    
    BOOL useSecondNumber;
    
    BOOL addition;
    BOOL subtraction;
    BOOL multiplication;
    BOOL divison;
//    BOOL percentage;
    
    BOOL clearScreen;
    
    
   


}



@end

@implementation CalcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)numberInputAction:(id)numberInput{
    if (clearScreen) {
        clearScreen = NO;
        self.calculatorTextField.text = @" ";
    }
    
    NSString *inputString = [numberInput currentTitle];
    
    NSString *currentDisplay = self.calculatorTextField.text;
    
    
    NSString *forTextOutput = [currentDisplay stringByAppendingString:inputString];
    
    self.calculatorTextField.text = forTextOutput;
    
    //convert input to current total
    double disPlayDouble = [forTextOutput doubleValue];
    
    
    if (!useSecondNumber) {
        currentTotal = [[NSNumber alloc]initWithDouble:disPlayDouble];
    }else {
        secondNumber = [[NSNumber alloc]initWithDouble:disPlayDouble];
    }
    
    
        

    
    
   
    NSLog(@"currenttotal is %@, secondnumber is %@", currentTotal, secondNumber);
    
  
}


#pragma mark - functions


- (IBAction)percentActionButton:(id)sender {
    
    clearScreen = YES;
    
    
   
    
    
    double percent = [currentTotal doubleValue] / 100;
    
    currentTotal = [[NSNumber alloc]initWithDouble:percent];
    
    
    
    NSString *forDisplay = [currentTotal stringValue];
    self.calculatorTextField.text = forDisplay;
    
    SEL aSelector = @selector(function:);
    [sender sendAction:aSelector to:nil forEvent:nil];
    
}



- (IBAction)additionActionButton:(UIButton *)sender{
    if (subtraction || divison || multiplication ) {
        SEL aSelector = @selector(function:);
        
        [sender sendAction:aSelector to:nil forEvent:nil];
    }
    
    addition = YES;
    useSecondNumber = YES;
    subtraction = NO;
    multiplication = NO;
    divison = NO;
    
    NSLog(@"setting adition to yes");
    
    self.calculatorTextField.text = @" ";
    
    SEL aSelector = @selector(function:);
    
    [sender sendAction:aSelector to:nil forEvent:nil];
    
 

}




- (IBAction)subTractionActionButton:(id)sender{
    if (addition || divison || multiplication ) {
        SEL aSelector = @selector(function:);
        
        [sender sendAction:aSelector to:nil forEvent:nil];
    }
    
    addition = NO;
    useSecondNumber = YES;
    subtraction = YES;
    multiplication = NO;
    divison = NO;
    
    self.calculatorTextField.text = @" ";
    
    SEL aSelector = @selector(function:);
    
    [sender sendAction:aSelector to:nil forEvent:nil];
    
}




- (IBAction)multiplicationActionButton:(id)sender{
    if (subtraction || divison || addition ) {
        SEL aSelector = @selector(function:);
        
        [sender sendAction:aSelector to:nil forEvent:nil];
    }
    
    
    addition = NO;
    useSecondNumber = YES;
    subtraction = NO;
    multiplication = YES;
    divison = NO;
    
    self.calculatorTextField.text = @" ";
    
    SEL aSelector = @selector(function:);
    
    [sender sendAction:aSelector to:nil forEvent:nil];
    
}

- (IBAction)divideActionButton:(id)sender{
    
    
    if (subtraction || addition || multiplication ) {
        SEL aSelector = @selector(function:);
        
        [sender sendAction:aSelector to:nil forEvent:nil];
    }
    
    addition = NO;
    useSecondNumber = YES;
    subtraction = NO;
    multiplication = NO;
    divison = YES;
    
    self.calculatorTextField.text = @" ";
    
    SEL aSelector = @selector(function:);
    
    [sender sendAction:aSelector to:nil forEvent:nil];
    
}






#pragma mark - clear and equals

- (IBAction)clearActionButton:(id)sender{
    
    //Clear everyting out
    currentTotal = nil;
    secondNumber = nil;
    
     useSecondNumber = NO;
    
     addition = NO;
     subtraction = NO;
     multiplication = NO;
     divison = NO;
    self.calculatorTextField.text = @" ";
    
}

#pragma mark = equals 

- (IBAction)equalsActionButton:(id)sender{
    
    
    clearScreen = YES;
    
        SEL aSelector = @selector(function:);
        [sender sendAction:aSelector to:nil forEvent:nil];
    
    
    
}


-(void)function:(UIButton *)sender {
    NSLog(@"this button works");
    
    if (addition && secondNumber != nil) {
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 + number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
//        addition = NO;
        
        NSString *forDisplay = [currentTotal stringValue];
        self.calculatorTextField.text = forDisplay;
        
    } else if (subtraction && secondNumber != nil) {
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 - number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
//        subtraction = NO;
        NSString *forDisplay = [currentTotal stringValue];
        self.calculatorTextField.text = forDisplay;
        
    } else if (multiplication && secondNumber != nil) {
        
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 * number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
//        multiplication = NO;
        NSString *forDisplay = [currentTotal stringValue];
        self.calculatorTextField.text = forDisplay;
        
    } else if (divison && secondNumber != nil ){
        
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 / number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
//        divison = NO;
        NSString *forDisplay = [currentTotal stringValue];
        self.calculatorTextField.text = forDisplay;
    }
    
    
    clearScreen = YES;
}


@end
