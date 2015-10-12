//
//  AlbumCollectionViewCell.h
//  myAlbums
//
//  Created by Michael Metzger  on 9/30/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *albumImage;
@property (weak, nonatomic) IBOutlet UILabel *albumName;

@end
