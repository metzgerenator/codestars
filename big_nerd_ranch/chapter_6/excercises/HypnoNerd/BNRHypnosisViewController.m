//
//  BNRHypnosisViewController.m
//  HypnoNerd
//

//

#import "BNRHypnosisViewController.h"
#import "BNRHyponsisView.h"

@interface BNRHypnosisViewController ()

@property (strong, nonatomic) UIColor *redColor;
@property (strong, nonatomic) UIColor *blueColor;
@property (strong, nonatomic) UIColor *greenColor;


@end

@implementation BNRHypnosisViewController

-(void)loadView
{
    //Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHyponsisView *backgroundView = [[BNRHyponsisView alloc]initWithFrame:frame];
    
    //Set it as *the* view of this view controller
    self.view = backgroundView;
    
//    UIColor *red = [UIColor redColor];
//    UIColor *green = [UIColor greenColor];
//    UIColor *blue = [UIColor blueColor];
        self.redColor = [UIColor redColor];
        self.greenColor = [UIColor greenColor];
        self.blueColor= [UIColor blueColor];
    
    UIImage *imageOne = [UIImage imageNamed:@"Hypno.png"];
     UIImage *imageTwo = [UIImage imageNamed:@"Hypno.png"];
     UIImage *imageThree = [UIImage imageNamed:@"Hypno.png"];
    
    
    
    
    NSArray *colors = @[imageOne,imageTwo,imageThree];
    
    
//    UISegmentedControl *control = [[UISegmentedControl alloc]initWithItems:@[@"red", @"green", @"blue"]];
     UISegmentedControl *control = [[UISegmentedControl alloc]initWithItems:colors];
    control.frame = CGRectMake((self.view.bounds.origin.x + 85), self.view.bounds.origin.y + 550, 200, 30);
    // configuring control
    control.tintColor = [UIColor whiteColor];
    
    [control addTarget:self action:@selector(action:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:control];
}


-(void)action:(UIButton*)sender {
    BNRHyponsisView *viewController = [[BNRHyponsisView alloc]init];
    viewController.circleColor = self.redColor;  
    NSLog(@"action works");
    
    
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
