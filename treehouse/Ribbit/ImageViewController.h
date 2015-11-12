//
//  ImageViewController.h
//  Ribbit
//
//  Created by Aileen Taboy on 11/11/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ImageViewController : UIViewController

@property(nonatomic,strong) PFObject *message;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end
