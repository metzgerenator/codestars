//
//  InputViewController.h
//  travel_planner
//
//  Created by Michael Metzger  on 9/18/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface InputViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *categoryPicture;
@property(nonatomic,strong)UIImage *categoryPictureName;



@property ToDoItem *toDoItem;



//@property (weak, nonatomic) IBOutlet UITextField *inputForList;
//@property (nonatomic,strong) NSString *inputForLisName;



@end
