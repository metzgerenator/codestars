//
//  AlbumCollectionViewController.m
//  myAlbums
//
//  Created by Michael Metzger  on 9/30/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import "AlbumCollectionViewController.h"
#import "AlbumCollectionViewCell.h"
#import "AlbumInfoViewController.h"


@interface AlbumCollectionViewController ()

@end

@implementation AlbumCollectionViewController
{
    NSArray *albumPhotos;
    NSArray *albumLargePhotos;
    NSArray *albumDescriptions;
    NSArray *albumInfoReleaseDates;
    NSArray *albumInformation;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    albumPhotos = @[@"alan.jpg", @"moon.png", @"zepplin.png"];
    albumDescriptions = @[@"I Robot", @"Dark Side of The Moon", @"Led Zepplin III"];
    albumInfoReleaseDates = @[@"1969",@"1970",@"1983"];
    albumInformation = @[@"Great album, bla bla bla bla bla bla",
                         @"it just sounds good bla blablablablablablablablablablablablablabla",
                         @"Because it's cool"];
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowAlbumInfo"]) {
        NSIndexPath *indexPaths = [self.collectionView indexPathsForSelectedItems][0];
        AlbumInfoViewController *destViewController = segue.destinationViewController;
        
        destViewController.albumInfoReleaseDateString = [albumInfoReleaseDates objectAtIndex:indexPaths.row];
        destViewController.albumCoverPhotoLargeString = [albumPhotos objectAtIndex:indexPaths.row];
        destViewController.albumInfoTitleString = [albumDescriptions objectAtIndex:indexPaths.row];
        destViewController.whyILikeAlbumString = [albumInformation objectAtIndex:indexPaths.row];
    }
}




#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [albumPhotos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AlbumCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.albumImage.image = [UIImage imageNamed:[albumPhotos objectAtIndex:indexPath.row]];
    cell.albumName.text = [albumDescriptions objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
