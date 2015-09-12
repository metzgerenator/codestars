//
//  ToDoitem.h
//  ToDoList


#import <Foundation/Foundation.h>

@interface ToDoitem : NSObject

@property NSString *itemName;

@property BOOL completed;

@property (readonly)NSDate *creationDate;

@end
