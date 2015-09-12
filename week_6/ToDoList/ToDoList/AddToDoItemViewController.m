//
//  AddToDoItemViewController.m
//  ToDoList
//


#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddToDoItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender != self.saveButton) return;
    
    if (self.textField.text.length > 0) {
        self.toDoItem = [[ToDoitem alloc ]init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;  
    }

}


@end
