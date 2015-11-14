//
//  InboxViewController.h
//  Ribbit
//
//  Created by Aileen Taboy on 11/10/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MediaPlayer/MediaPlayer.h>

@interface InboxViewController : UITableViewController

@property (nonatomic, strong) NSArray *messages;

@property (nonatomic, strong) PFObject *selectedMessage;

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;  

- (IBAction)logout:(id)sender;


@end
