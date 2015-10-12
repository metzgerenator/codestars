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
    NSArray *albumAuthor;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    albumPhotos = @[@"alan.jpg",
                    @"moon.png",
                    @"zepplin.png",
                    @"heart.png",
                    @"blade.png",
                    @"foreigner.png",
                    @"obscured.png",
                    @"santana.png",
                    @"plastic.png",
                    @"airplane.png"];
    
    albumDescriptions = @[@"I Robot",
                          @"Dark Side of The Moon",
                          @"Led Zepplin III",
                          @"The Essential Heart",
                          @"Blade Runner Soundtrack",
                          
                          @"No End in Sight",
                          @"Obscured by Clouds",
                          @"The Essential Santana",
                          @"Plastic Beach",
                          @"Essential Jefferson Airplane"];
    
    albumInfoReleaseDates = @[@"1977",
                              @"1973",
                              @"1970",
                              @"2002",
                              @"1982",
                              @"2008",
                              @"1972",
                              @"2002",
                              @"2010",
                              @"2005"];
    
    albumInformation = @[@"I like this album because it is inspired by Isaac Asimov's novel",
                         
                         @"Ground Breaking.  You have to listen to this entire album in one setting.  It also matches the movie Wizzard of Ozz.  Although, the band claims this was not intentional",
                         
                         @"Every song on this album is a hit.  Led Zeppelin III is now generally praised, and acknowledged as representing an important milestone in their history. Although acoustic songs are featured on its predecessors, it is this album which is widely acknowledged for showing that Led Zeppelin were more than just a conventional rock band and that they could branch out into wider musical territory."
                         ,
                         @"If you have never had the opportunity to listen to Heart before then this album is a good start.  The collection spans the band's history from 1975 through 1995.",
                         @"It's the soundtrack to one of my favorite science-fiction movies.  Also, a good choice for background music while studying",
                         
                         @"Awesome Greatest hits collection.  It's a two disc set too.  Foreigner is a British-American rock band, originally formed in 1976",
                         
                         @"Obscured by Clouds is the seventh studio album by English progressive rock band Pink Floyd, based on their soundtrack for the French film La Vallée, by Barbet Schroeder.",
                         
                         @"Santa is an incredible mix of all types of music.  It's amazing how many compilations he has done with other artists. The collection is part of a series of Essential sets released by Columbia Records.",
                         
                         @"Plastic Beach is the third studio album by British virtual band Gorillaz.  Their albums are all unique and they have crazy music videos",
                         
                         @"comprehensive album of one of the best rock bands of all time."
                         ];
    
    
    albumAuthor = @[@"The Alan Parsons Project",
                    @"Pink Floyd",
                    @"Led Zepplin",
                    @"Heart",
                    @"Vangelis",
                    @"Foreigner",
                    @"Pink Floyd",
                    @"Santana",
                    @"Gorillaz",
                    @"Jefferson Airplane"];
    
    
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
        destViewController.albumAuthorString = [albumAuthor objectAtIndex:indexPaths.row];

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
