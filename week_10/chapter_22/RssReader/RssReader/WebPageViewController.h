//
//  WebPageViewController.h
//  RssReader
//

//

#import <UIKit/UIKit.h>

@interface WebPageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *link;  


@end
