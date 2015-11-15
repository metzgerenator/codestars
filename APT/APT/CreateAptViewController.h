//
//  CreateAptViewController.h
//  APT
//
//  Created by Aileen Taboy on 11/14/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FSCalendar/FSCalendar.h>

@interface CreateAptViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UIDatePicker *dateInstance;

@property(nonatomic,strong)NSDate *selectedTime;
@property (nonatomic,strong)NSDate *selectedDate;

- (IBAction)cancelbutton:(id)sender;
- (IBAction)savButton:(id)sender;

@end
