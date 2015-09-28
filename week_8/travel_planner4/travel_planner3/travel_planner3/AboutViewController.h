//
//  AboutViewController.h
//  travel_planner3
//
//  Created by Aileen Taboy on 9/28/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIImageView *aboutPicture;
@property (nonatomic, strong)UIImage *homeImage;

@end
