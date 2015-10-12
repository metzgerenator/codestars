//
//  AlbumInfoViewController.m
//  myAlbums
//
//  Created by Michael Metzger  on 9/30/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import "AlbumInfoViewController.h"

@interface AlbumInfoViewController ()

@end

@implementation AlbumInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.albumCoverPhotoLarge.image =  [UIImage imageNamed:self.albumCoverPhotoLargeString];
 
    
    self.albumInfoTitle.text = self.albumInfoTitleString;
    
    self.albumInfoReleaseDate.text = self.albumInfoReleaseDateString;
    
    self.whyILikeAlbum.text = self.whyILikeAlbumString;
    
    self.albumAuthor.text = self.albumAuthorString;
    
    
    
    
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

- (IBAction)backButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
@end
