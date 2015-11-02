//
//  BNRItem.h
//  RandomItems
//

//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

+ (instancetype)randomItem;  

//Designated initializer for BNRITem
-(instancetype) initWithItemName: (NSString *) name
                  valueInDollars: (int)value
                    serialNumber: (NSString *)sNumber;

-(instancetype)initWithItemName: (NSString *) name;

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic )int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;


@end
