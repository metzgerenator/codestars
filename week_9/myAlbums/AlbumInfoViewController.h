//
//  AlbumInfoViewController.h
//  myAlbums
//
//  Created by Michael Metzger  on 9/30/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *albumCoverPhotoLarge;
@property (weak, nonatomic) NSString * albumCoverPhotoLargeString;


@property (weak, nonatomic) IBOutlet UITextField *albumInfoTitle;
@property (weak, nonatomic)NSString *albumInfoTitleString;

@property (weak, nonatomic) IBOutlet UITextField *albumInfoReleaseDate;
@property (weak, nonatomic)NSString *albumInfoReleaseDateString;

@property (weak, nonatomic) IBOutlet UITextView *whyILikeAlbum;
@property (weak, nonatomic) NSString *whyILikeAlbumString;  
- (IBAction)backButton:(id)sender;

@end
