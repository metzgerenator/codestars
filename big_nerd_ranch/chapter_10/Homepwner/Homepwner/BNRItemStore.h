//
//  BNRItemStore.h
//  Homepwner
//

#import <Foundation/Foundation.h>
@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic,readonly,copy)NSArray *allItems;

//Noteic that this is a class method and prefixed with a + instead of a -
+(instancetype)sharedStore;
-(BNRItem *) createItem;
-(void)removeItem: (BNRItem *)item;

-(void)moveItemAtIndex: (NSUInteger)fromIndex toIndex: (NSUInteger)toIndex;


@end
