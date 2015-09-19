//
//  InputViewController.h
//  travel_planner
//
//  Created by Michael Metzger  on 9/18/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputViewController : UIViewController <UITabBarDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *categoryPicture;
@property(nonatomic,strong)UIImage *categoryPictureName;


//@property (weak, nonatomic) IBOutlet UITextField *inputForList;
//@property (nonatomic,strong) NSString *inputForLisName;



@end
