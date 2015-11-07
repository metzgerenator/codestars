//
//  CalcViewController.h
//  calculator2
//
//  Created by Michael Metzger  on 11/4/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *calculatorTextField;



- (IBAction)numberInputAction:(id)numberInput;


- (IBAction)percentActionButton:(id)sender;




- (IBAction)clearActionButton:(id)sender;

- (IBAction)divideActionButton:(id)sender; //

- (IBAction)multiplicationActionButton:(id)sender;//

- (IBAction)subTractionActionButton:(id)sender;//

- (IBAction)additionActionButton:(id)sender;//

- (IBAction)equalsActionButton:(id)sender;//

@end
