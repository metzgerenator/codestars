//
//  NewRecipeTableViewController.h
//  RecipeApp
//
//  Created by Aileen Taboy on 10/11/15.
//  Copyright © 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewRecipeTableViewController : UITableViewController
<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView1;



@end
