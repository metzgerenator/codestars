//
//  AddToPackingListTableViewController.m
//  Travel Buddy
//
//

#import "AddToPackingListTableViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <Parse/Parse.h>

@interface AddToPackingListTableViewController ()

@end

@implementation AddToPackingListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addItemField.delegate = self;
    
    
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Table view data source



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self showPhotoLibrary];   
    }
}

-(void)showPhotoLibrary
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]==NO) {
        
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    //Displays saved pictures from the Camera Roll album
    picker.mediaTypes = @[(NSString*)kUTTypeImage];
    
    //Hides the controls for moving & scaling pictures
    picker.allowsEditing = NO;
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}

// take a Photo

-(IBAction)takePhoto:(id)sender{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
        
    }
    
}

- (IBAction)CancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //Change to allow no picture loaded
    
    
    self.itemPicture.image = originalImage;
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}




#pragma mark - Navigation



- (IBAction)saveItemButton:(id)sender {
    // Create PFOBject with item information
    PFObject *packItem = [PFObject objectWithClassName:@"itemsToPack"];
    //secure object
    
    packItem.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
    
    [packItem setObject:self.addItemField.text forKey:@"item"];
    
   
    
    //Pack item Image
    NSData *imageData = UIImageJPEGRepresentation(self.itemPicture.image, 0.8);
    NSString *filename = [NSString stringWithFormat:@"%@.png", self.addItemField.text];
    PFFile *imageFile = [PFFile fileWithName:filename data:imageData];
    [packItem setObject:imageFile forKey:@"itemImage"];
    
    //Show progress
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator bringSubviewToFront:self.view];
    [indicator startAnimating];
    
    //Upload to Parse
    [packItem saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        [indicator stopAnimating];
        
        if (!error) {
            // Dismiss the controller
            [self dismissViewControllerAnimated:YES completion:nil];
            
            //Notify table view to reload
            [[NSNotificationCenter defaultCenter]postNotificationName:@"refreshTable" object:self];
        }else {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Upload Failure" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okayAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:okayAction];
            [self presentViewController:alertController animated:YES completion:nil];
            
        }
       
        

    }];
    
    // exit out
    
    
    
    
    
    
    
    
    
    
    
}
@end
