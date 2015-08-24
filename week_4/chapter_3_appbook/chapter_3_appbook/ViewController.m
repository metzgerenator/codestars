//
//  ViewController.m
//  chapter_3_appbook
//
//  Created by Aileen Taboy on 8/24/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController





{
    NSArray *recipes;  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    recipes = @[@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger",
                @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee",
                @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"JapaneseNoodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini"];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"creme_brelee"];
    
    return cell;
}



@end
