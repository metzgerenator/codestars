//
//  BNRImageStore.h
//  Homepwner
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface BNRImageStore : NSObject

+(instancetype)sharedStore;


-(void)setImage:(UIImage *)image forKey:(NSString *)key;
-(UIImage *)imageFOrKey:(NSString *)key;
-(void)deleteImageForKey:(NSString *)key;   




@end
