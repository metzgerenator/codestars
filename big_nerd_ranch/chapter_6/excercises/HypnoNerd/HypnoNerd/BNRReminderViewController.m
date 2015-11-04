//
//  BNRReminderViewController.m
//  HypnoNerd
//
//

#import "BNRReminderViewController.h"



@interface BNRReminderViewController ()

@property (nonatomic, weak)IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

-(IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    
//    NSDateFormatter *formatedDate = [NSDateFormatter all]
    
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc]init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    
    // added code to ask the user for permission with notifications 
    [[UIApplication sharedApplication] registerUserNotificationSettings:
     [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert)
                                       categories:nil]];
    
    
    [[UIApplication sharedApplication]scheduleLocalNotification:note];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"BNRReminderViewController loaded its view.");
}


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //Set the tab bar item's title
        self.tabBarItem.title = @"Reminder";
        
        //Create a UIImage from a file
        //This will use time@2x.png on retin display devices
        UIImage *image = [UIImage imageNamed:@"Time.png"];
        
        //Put that image on the tab bar item
        self.tabBarItem.image = image;
    }
    
    return self;  
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
