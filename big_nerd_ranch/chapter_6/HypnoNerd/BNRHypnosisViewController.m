//
//  BNRHypnosisViewController.m
//  HypnoNerd
//

//

#import "BNRHypnosisViewController.h"
#import "BNRHyponsisView.h"

@interface BNRHypnosisViewController ()

@end

@implementation BNRHypnosisViewController

-(void)loadView
{
    //Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHyponsisView *backgroundView = [[BNRHyponsisView alloc]initWithFrame:frame];
    
    //Set it as *the* view of this view controller
    self.view = backgroundView;
}


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        //Create a UIImage from a file
        //This will use Hypno@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        
        //Put that image on the tab bar item
        self.tabBarItem.image = image;
    }
    return self;   
}





- (void)viewDidLoad {
    
    //Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");   
    
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
