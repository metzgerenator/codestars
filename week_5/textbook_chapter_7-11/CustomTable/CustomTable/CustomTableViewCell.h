//
//  CustomTableViewCell.h
//  CustomTable
//
//  Created by Aileen Taboy on 8/25/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property(nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumnailImageView;  


@end
