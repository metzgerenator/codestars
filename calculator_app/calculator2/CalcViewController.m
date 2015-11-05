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
    NSNumber * CurrentTotal;
    NSNumber * otherNumber;  
    
    BOOL addition;
    BOOL subtraction;
    BOOL multiplication;
    BOOL divison;
    
    BOOL numberTwo;


}



@end

@implementation CalcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    
//    if (otherNumber == NULL && CurrentTotal == NULL) {
//        CurrentTotal = [[NSNumber alloc]initWithDouble:disPlayDouble];
//        
//       
//        
//    }else if (CurrentTotal!= NULL) {
//        
//        otherNumber = [[NSNumber alloc]initWithDouble:disPlayDouble];
//    }
    
    if (!numberTwo) {
        CurrentTotal = [[NSNumber alloc]initWithDouble:disPlayDouble];
        
        
        
    }else if (numberTwo) {
        
        otherNumber = [[NSNumber alloc]initWithDouble:disPlayDouble];
    }
    
    
    
   
    NSLog(@"currenttotal is %@ othernumber is %@", CurrentTotal, otherNumber);
    
    
    
    
    
    
    
    
}

#pragma mark - functions

- (IBAction)additionActionButton:(id)sender{
//    if (otherNumber != NULL) {
    
    if (numberTwo) {
        CalcFunctions *additionFunction = [[CalcFunctions alloc]init];
      CurrentTotal = [additionFunction addition:[CurrentTotal doubleValue] secondDouble:[otherNumber doubleValue]];
        
        NSLog(@"current total is %@ othernumber is %@", CurrentTotal, otherNumber);
        otherNumber = NULL;
        
       
        
        
        
    } else {
        
        numberTwo = YES;
        
        addition = YES;
        subtraction = NO;
        multiplication = NO;
        divison = NO;
        
    }
    
    NSLog(@"current total is %@ othernumber is %@", CurrentTotal, otherNumber);
    
    self.calculatorTextField.text = @" ";
    
}



- (IBAction)subTractionActionButton:(id)sender{
    
    if (numberTwo) {
        CalcFunctions *subtractionFunction = [[CalcFunctions alloc]init];
       CurrentTotal = [subtractionFunction subtraction:[CurrentTotal doubleValue] secondDouble:[otherNumber doubleValue]];
        
        NSLog(@"current total is %@ othernumber is %@", CurrentTotal, otherNumber);
        otherNumber = NULL;
        
        
        
    } else {
        numberTwo = YES;
        
        addition = NO;
        subtraction = YES;
        multiplication = NO;
        divison = NO;
        
    }
    
    NSLog(@"current total is %@ othernumber is %@", CurrentTotal, otherNumber);
    
    self.calculatorTextField.text = @" ";
    
    
    
    
}







#pragma mark - clear and equals

- (IBAction)clearActionButton:(id)sender{
    
    //Clear everyting out
    CurrentTotal = NULL;
    otherNumber = NULL;
    addition = NO;
    subtraction = NO;
    multiplication = NO;
    divison = NO;
    
    numberTwo = NO;
    
    self.calculatorTextField.text = @" ";
    
}


- (IBAction)equalsActionButton:(id)sender{
    
    
    
    
    if (addition) {
        CalcFunctions *additionFunction = [[CalcFunctions alloc]init];
        CurrentTotal = [additionFunction addition:[CurrentTotal doubleValue] secondDouble:[otherNumber doubleValue]];
        
        
        otherNumber = NULL;
        NSLog(@"current total is %@ othernumber is %@", CurrentTotal, otherNumber);
        NSString *forDisplay = [CurrentTotal stringValue];
        self.calculatorTextField.text = forDisplay;
 
    }else if (subtraction){
        
        CalcFunctions *subtractionFunction = [[CalcFunctions alloc]init];
        CurrentTotal = [subtractionFunction subtraction:[CurrentTotal doubleValue] secondDouble:[otherNumber doubleValue]];
        
        
        otherNumber = NULL;
        NSLog(@"current total is %@ othernumber is %@", CurrentTotal, otherNumber);
        NSString *forDisplay = [CurrentTotal stringValue];
        self.calculatorTextField.text = forDisplay;
        
        
        
    }
    
    
    
}

@end
