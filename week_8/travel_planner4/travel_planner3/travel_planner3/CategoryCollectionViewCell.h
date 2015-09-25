//
//  CategoryCollectionViewCell.h
//  travel_planner3
//
//  Created by Michael Metzger  on 9/25/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryCollectionViewCell : UICollectionViewCell
@property (weak,nonatomic) IBOutlet UIImageView *categoryImage;

@property(weak, nonatomic) IBOutlet UILabel *categoryLable;  


@end
