//
//  HypnosisViewController.m
//  Hyponsister
//
//  Created by Aileen Taboy on 10/31/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "HypnosisViewController.h"
#import "BNRHyponsisView.h"

@interface HypnosisViewController ()

@end

@implementation HypnosisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect frame = [UIScreen mainScreen].bounds;
    
    BNRHyponsisView *backgroundView = [[BNRHyponsisView alloc]initWithFrame:frame];
    
    //set the backgroundView as the view of this controller
    self.view = backgroundView;   
    
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
