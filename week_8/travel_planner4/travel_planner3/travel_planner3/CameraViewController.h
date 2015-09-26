//
//  CameraViewController.h
//  travel_planner3
//
//  Created by Aileen Taboy on 9/26/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;
- (IBAction)selectPhoto:(id)sender;

@end
