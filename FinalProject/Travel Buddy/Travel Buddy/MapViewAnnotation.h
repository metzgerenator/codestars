//
//  MapViewAnnotation.h
//  Travel Buddy
//
//  Created by Michael Metzger  on 10/20/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapViewAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;  

@end
