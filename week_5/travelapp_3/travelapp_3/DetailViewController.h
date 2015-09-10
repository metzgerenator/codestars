//
//  DetailViewController.h
//  travelapp_3
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController


@property (nonatomic, strong) IBOutlet UILabel *destinationLabel;
@property (nonatomic, strong) NSString *destinationName;


@property (nonatomic, strong) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, strong) NSString *descriptionName;


@property (strong, nonatomic) IBOutlet UIImageView *destinationPicture;
@property (nonatomic, strong) UIImage *imagedescription;

@end
