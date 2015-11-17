//
//  PhotosCollectionViewController.h
//  APT
//
//  Created by Michael Metzger  on 11/16/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/PFQueryCollectionViewController.h>


@interface PhotosCollectionViewController : PFQueryCollectionViewController{
    NSArray *imageFilesArray;  
    NSMutableArray *imagesArray;
}



@property(nonatomic, strong) PFObject *pfObjectfromInfoView;

@end
