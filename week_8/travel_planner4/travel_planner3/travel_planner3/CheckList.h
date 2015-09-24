//
//  CheckList.h
//  travel_planner3
//
//  Created by Aileen Taboy on 9/24/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckList : NSObject

@property NSString *itemName;

@property BOOL completed;

@property (readonly)NSDate *creationDate;

@end
