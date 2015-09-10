//
//  AboutViewController.h
//  travelapp_3
//


#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (nonatomic, strong)IBOutlet UIWebView *webView;

@property (strong, nonatomic) IBOutlet UIImageView *aboutPicture;
@property (nonatomic, strong) UIImage *homeImage;

@end
