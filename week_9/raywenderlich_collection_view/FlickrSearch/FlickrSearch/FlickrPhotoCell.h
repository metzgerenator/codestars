//
//  FlickrPhotoCell.h
//  FlickrSearch
//
//  Created by Aileen Taboy on 9/29/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@class FlickrPhoto;


@interface FlickrPhotoCell: UICollectionViewCell
@property (nonatomic,strong) IBOutlet UIImageView *imageView;
@property (nonatomic,strong) FlickrPhoto *photo;  

@end
