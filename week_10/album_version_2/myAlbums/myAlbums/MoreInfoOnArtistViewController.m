//
//  MoreInfoOnArtistViewController.m
//  myAlbums
//



#import "MoreInfoOnArtistViewController.h"

@interface MoreInfoOnArtistViewController ()

@end

@implementation MoreInfoOnArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   NSString *website = @"https://en.wikipedia.org/wiki/The_Alan_Parsons_Project";
    NSURL *url = [NSURL URLWithString:website];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.artistWiki loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
