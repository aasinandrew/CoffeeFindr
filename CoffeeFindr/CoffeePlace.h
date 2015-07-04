//
//  CoffeePlace.h
//  CoffeeFindr
//
//  Created by Andrew  Nguyen on 7/2/15.
//  Copyright (c) 2015 Andrew Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapkit/MapKit.h>

@interface CoffeePlace : NSObject
@property MKMapItem *mapItem;
@property float milesDifference;

@end
