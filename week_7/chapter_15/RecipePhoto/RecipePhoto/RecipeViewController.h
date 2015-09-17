//
//  RecipeViewController.h
//  RecipePhoto
//
//  Created by Michael Metzger  on 9/17/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;

- (IBAction)close:(id)sender;

@property (weak, nonatomic) NSString *recipeImageName;

@end
