//
//  InputViewController.m
//  travel_planner
//
//  Created by Michael Metzger  on 9/18/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import "InputViewController.h"
#import "ToDoItem.h"

@interface InputViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation InputViewController{
    NSMutableArray *toDoItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    
    
    self.categoryPicture.image = self.categoryPictureName;
//    self.inputForList.text = self.inputForLisName;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [toDoItems count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    ToDoItem *toDoItem = [toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;  
    }
    
    return cell;
}





-(void)loadInitialData {
    
    ToDoItem *item1 = [[ToDoItem alloc]init];
    item1.itemName = @"test item 1";
    
    [toDoItems addObject:item1];
    
    ToDoItem *item2 = [[ToDoItem alloc]init];
    item2.itemName = @"testing 2";
    
    [toDoItems addObject:item2];
    
    
}



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *tappedItem = [toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    
}

- (IBAction)savButton:(UITextField*)inputText {
    
//    self.toDoItem = [[ToDoItem alloc]init];
//    self.toDoItem.itemName = self.textField.text;
//    self.toDoItem.completed = NO;
    
    if (self.textField != nil) {
        NSString *item = self.textField.text;
        [toDoItems addObject:item];
        
        
    }
    
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
