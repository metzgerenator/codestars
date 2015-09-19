//
//  ToDoItem.h
//  travel_planner
//
//  Created by Michael Metzger  on 9/19/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;


@end
