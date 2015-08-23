//
//  ViewController.m
//  Appatempt2
//
//  Created by Michael Metzger  on 8/19/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import "ViewController.h"

@interface ViewController()

@end

@implementation ViewController

{
    NSArray *NYCActivities;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [NYCActivities count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.textLabel.text = [NYCActivities objectAtIndex:indexPath.row];
    
    return cell;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NYCActivities = @[@"Artichoke Pizza", @"Gotham West Market", @"Central Park", @"The Plaza Food Hall", @"MoMA", @"Grand Central", @"Bryant Park", @"Botanical Garden", @"ShakesPeare in the Park", @"City Kitchen", @"Le District"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)activityGenerator{


    int random = arc4random_uniform((int)NYCActivities.count);
   
    
    NSArray *colorArray = @[[UIColor redColor], [UIColor blueColor], [UIColor blackColor], [UIColor greenColor], [UIColor grayColor] ];
    
     int colorRandom = arc4random_uniform((int)colorArray.count);
    
    self.factGenerator.text = [NYCActivities objectAtIndex:random];
    
    self.view.backgroundColor = colorArray[colorRandom];

    
    
    
}


@end
