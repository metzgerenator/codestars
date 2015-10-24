//
//  ViewController.m
//  MapTime
//
//  Created by Michael Metzger  on 10/24/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray *placeMarks;  
}
@property (nonatomic, strong) MKLocalSearch *localSearch;


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

- (IBAction)searchButton:(id)sender {
    
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc]init];
    request.naturalLanguageQuery = self.searchTextField.text;
    
    //set the user region
    request.region = self.MapView.region;
    
    //Create and initialize search object
    
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error){
        
        //place search results in the array
        placeMarks = [response mapItems];
        
        
        //load our two viewdidload methods
        [self viewDidDisappear:YES];
        [self viewDidAppear:YES];
        
    };
    
    self.localSearch = [[MKLocalSearch alloc]initWithRequest:request];
    [self.localSearch startWithCompletionHandler:completionHandler];
    
    
    //Remove the keyboard after editing
    
    [self.view endEditing:YES];
    

}
@end
