//
//  Shape.h
//  HeightandWidth
//
//

#import <Foundation/Foundation.h>


@interface Shape : NSObject

@property (nonatomic) NSNumber *height;
@property (nonatomic) NSNumber *width;

-(NSNumber *) areaCalculator;

@end
