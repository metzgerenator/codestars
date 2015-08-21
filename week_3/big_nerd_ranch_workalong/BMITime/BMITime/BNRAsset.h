//
//  BNRAsset.h
//  BMITime
//
//  Created by Aileen Taboy on 8/21/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNREmployee;


@interface BNRAsset : NSObject

@property (nonatomic, copy) NSString *label;
@property (nonatomic, weak) BNREmployee *holder;
@property (nonatomic) unsigned int resaleValue;   

@end
