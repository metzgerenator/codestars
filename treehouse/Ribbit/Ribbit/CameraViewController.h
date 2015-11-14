//
//  CameraViewController.h
//  Ribbit
//
//  Created by Aileen Taboy on 11/11/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CameraViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic,strong) UIImage *image;

@property (strong, nonatomic) NSString *videoFilePath;

@property (nonatomic,strong)NSArray *friends;
@property (nonatomic,strong) PFRelation *friendsRelation;
@property (nonatomic,strong) NSMutableArray *recipients;

- (IBAction)cancel:(id)sender;
- (IBAction)send:(id)sender;

-(void)uploadMessage;

-(UIImage *)resizeImage:(UIImage *)image toWidth:(float)width andHeight:(float)height;



@end
