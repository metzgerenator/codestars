//
//  GreatestArtistViewController.m
//  myAlbums
//
//  Created by Aileen Taboy on 10/12/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import "GreatestArtistViewController.h"

@interface GreatestArtistViewController ()

@end

@implementation GreatestArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.artistImage.image = [UIImage imageNamed:@"AlanParsons.png"];
    
    self.artistName.text = @"The Alan Parsons Project";
    
    
    self.artistDescription.text = @"The Alan Parsons Project was a progressive rock music entity comprised of engineer/ producer Alan Parsons and songwriter, musician and manager Eric Woolfson. They released 10 concept albums between 1976 – 1987 and have sold over 50 million albums world-wide.  To me this is one of the best Artists out there because they released their own incredible albums and did the sound production other progressive bands such as Pink Floyd";
    

    
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
