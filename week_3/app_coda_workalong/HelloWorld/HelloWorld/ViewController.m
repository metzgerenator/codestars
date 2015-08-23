//
//  ViewController.m
//  HelloWorld


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)shwoMessage {
    UIAlertController *helloWorldAlert = [UIAlertController alertControllerWithTitle:@"My First App" message:@"Hello World!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okayAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [helloWorldAlert addAction:okayAction];
    
    // Display the Hello World Message
    [self presentViewController:helloWorldAlert animated:YES completion:nil];
}




@end
