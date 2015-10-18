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

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    self.itemPicture.image = originalImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveItemButton:(id)sender {
    // Create PFOBject with recipe information
    PFObject *packItem = [PFObject objectWithClassName:@"itemsToPack"];
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
