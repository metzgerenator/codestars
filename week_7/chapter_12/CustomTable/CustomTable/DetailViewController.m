//
//  DetailViewController.m
//  CustomTable
//
//  Created by Aileen Taboy on 8/30/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.recipe.name;
    self.prepTimeLabel.text = self.recipe.preptime;
    self.recipeImageView.image = [UIImage imageNamed:self.recipe.image];
    
    NSMutableString *ingredientsText = [NSMutableString string];
    
    for (NSString* ingredient in self.recipe.ingredients) {
        [ingredientsText appendFormat:@"%@\n", ingredient];
        self.ingredientsTextView.text = ingredientsText;
    }
    
    
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
