//
//  RecipeCollectionViewController.h
//  RecipePhoto
//
//  Created by Michael Metzger  on 9/16/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeCollectionViewController : UICollectionViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;

-(IBAction)ShareButtonTapped:(id)sender;




@end
