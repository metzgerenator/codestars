//
//  DetailViewController.h
//  travel_destinations
//
//  Created by Michael Metzger  on 9/4/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *placesDescription;
@property (nonatomic, strong) NSString *placesName;


@property (weak, nonatomic) IBOutlet UIImageView *imagesOfPlaces;
@property (nonatomic, strong)UIImage *pictures;




@end
