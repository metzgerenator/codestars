//
//  DetailViewController.h
//  CustomTable
//
//  Created by Aileen Taboy on 8/30/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface DetailViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIImageView *recipeImageView;
@property (strong, nonatomic) IBOutlet UILabel *prepTimeLabel;
@property (strong, nonatomic) IBOutlet UITextView *ingredientsTextView;

@property(nonatomic, strong) Recipe *recipe;

@end
