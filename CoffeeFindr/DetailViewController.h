//
//  DetailViewController.h
//  CoffeeFindr
//
//  Created by Andrew  Nguyen on 7/3/15.
//  Copyright (c) 2015 Andrew Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoffeePlace.h"

@interface DetailViewController : UIViewController
@property CoffeePlace *coffeePlace;
@property CLLocation *currentLocation;

@end
