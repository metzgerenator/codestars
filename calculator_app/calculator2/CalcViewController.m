//
//  CalcViewController.m
//  calculator2
//
//  Created by Michael Metzger  on 11/4/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "CalcViewController.h"
#import "CalcFunctions.h"

@interface CalcViewController ()

{
    NSNumber * currentTotal;
    NSNumber * secondNumber;
    
    BOOL useSecondNumber;
    
    BOOL addition;
    BOOL subtraction;
    BOOL multiplication;
    BOOL divison;
    
   


}



@end

@implementation CalcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (addition && secondNumber != nil) {
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 + number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
        addition = NO;
        
    } else if (subtraction && secondNumber != nil) {
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 - number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
        subtraction = NO;
        
    } else if (multiplication && secondNumber != nil) {
        
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 * number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
        multiplication = NO;
        
    } else if (divison && secondNumber != nil ){
        
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 / number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
        divison = NO;
        
    }
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)numberInputAction:(id)numberInput{
    
    
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

- (IBAction)additionActionButton:(id)sender{
    
    addition = YES;
    useSecondNumber = YES;
    subtraction = NO;
    multiplication = NO;
    divison = NO;
   
    self.calculatorTextField.text = @" ";
    [self viewDidAppear:YES];

}



- (IBAction)subTractionActionButton:(id)sender{
    
    addition = NO;
    useSecondNumber = YES;
    subtraction = YES;
    multiplication = NO;
    divison = NO;
    
    self.calculatorTextField.text = @" ";
    [self viewDidAppear:YES];
    
}




- (IBAction)multiplicationActionButton:(id)sender{
    addition = NO;
    useSecondNumber = YES;
    subtraction = NO;
    multiplication = YES;
    divison = NO;
    
    self.calculatorTextField.text = @" ";
    [self viewDidAppear:YES];
    
}

- (IBAction)divideActionButton:(id)sender{
    
    addition = NO;
    useSecondNumber = YES;
    subtraction = NO;
    multiplication = NO;
    divison = YES;
    
    self.calculatorTextField.text = @" ";
    [self viewDidAppear:YES];
    
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


- (IBAction)equalsActionButton:(id)sender{
    
    if (addition && secondNumber != nil) {
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 + number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
        addition = NO;
        NSString *forDisplay = [currentTotal stringValue];
        self.calculatorTextField.text = forDisplay;
        
    } else if (subtraction && secondNumber != nil) {
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 - number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
        subtraction = NO;
        NSString *forDisplay = [currentTotal stringValue];
        self.calculatorTextField.text = forDisplay;
        
    } else if (multiplication && secondNumber != nil) {
        
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 * number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
        multiplication = NO;
        NSString *forDisplay = [currentTotal stringValue];
        self.calculatorTextField.text = forDisplay;
        
    } else if (divison && secondNumber != nil ){
        
        double number1 = [currentTotal doubleValue];
        double number2 = [secondNumber doubleValue];
        double answer = number1 / number2;
        
        currentTotal = [[NSNumber alloc]initWithDouble:answer];
        secondNumber = nil;
        
        NSLog(@"answer is %f", answer);
        divison = NO;
        NSString *forDisplay = [currentTotal stringValue];
        self.calculatorTextField.text = forDisplay;
        
    }
    
    
}


@end
