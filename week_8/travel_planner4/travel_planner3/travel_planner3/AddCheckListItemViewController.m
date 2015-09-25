//
//  AddCheckListItemViewController.m
//  travel_planner3
//
//  Created by Aileen Taboy on 9/24/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "AddCheckListItemViewController.h"

@interface AddCheckListItemViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;  

@end

@implementation AddCheckListItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender != self.saveButton)return;
    
    if (self.textField.text.length > 0) {
        self.checkListItem = [[CheckList alloc]init];
        self.checkListItem.itemName = self.textField.text;
        self.checkListItem.completed = NO;
    }
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
