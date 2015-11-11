//
//  BNRDetailViewController.m
//  Homepwner
//
//

#import "BNRItem.h"
#import "BNRDetailViewController.h"

@interface BNRDetailViewController ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;

@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation BNRDetailViewController


- (IBAction)backgroundTapped:(id)sender {
    
    [self.view endEditing:YES];    
}



- (IBAction)takePicture:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    
    //If the device has a camera, take a picture, otherwise,
    
    //just pick from photo library
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    //Place image picker on the screen
    [self presentViewController:imagePicker animated:YES completion:NULL];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //Get picked image from dictionary
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    
    //Store the image in the BNRImageStore for this key
    [[BNRImageStore sharedStore]setImage:image forKey:self.item.itemKey];   
    
    //Put that image onto the screen in our image view
    self.imageView.image = image;
    
    //Take image picker off the screen -
    //you must call  this dismiss method
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    BNRItem *item = self.item;
    
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    
    //You need an NSDateFormatter that will turn a date into a simple date string
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    //Use filtered NSDate object to set dateLabel contents
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    NSString *itemKey = self.item.itemKey;
    
    //Get the image for its image key from the image store
    UIImage *imageToDisplay = [[BNRImageStore sharedStore]imageFOrKey:itemKey];
    
    //Use that image to put on the screen in the imageView
    self.imageView.image = imageToDisplay;
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //Clear first responder
    [self.view endEditing:YES];
    
    //Save changes to item
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;   
}

@end
