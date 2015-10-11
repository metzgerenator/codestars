//
//  RssItem.h
//  RssReader
//
//  Created by Aileen Taboy on 10/10/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RssItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic)NSString *link;
@property (strong, nonatomic) NSString *contentDescription;
@property (strong, nonatomic) NSString *pubDate;  

@end
