//
//  DetailViewController.m
//  CoffeeFindr
//
//  Created by Andrew  Nguyen on 7/3/15.
//  Copyright (c) 2015 Andrew Nguyen. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.coffeePlace.mapItem.name;
    [self getPathDirections:self.currentLocation.coordinate withDestination:self.coffeePlace.mapItem.placemark.location.coordinate];
}

- (void)getPathDirections:(CLLocationCoordinate2D)source withDestination:(CLLocationCoordinate2D)destination {
    MKPlacemark *placemarkSrc = [[MKPlacemark alloc] initWithCoordinate:source addressDictionary:nil];
    MKMapItem *mapIteamSrc = [[MKMapItem alloc] initWithPlacemark:placemarkSrc];

    MKPlacemark *placemarkDest =[[MKPlacemark alloc] initWithCoordinate:destination addressDictionary:nil];
    MKMapItem *mapItemDest = [[MKMapItem alloc] initWithPlacemark:placemarkDest];

    MKDirectionsRequest *request = [MKDirectionsRequest new];
    [request setSource:mapIteamSrc];
    [request setDestination:mapItemDest];
    [request setTransportType:MKDirectionsTransportTypeWalking];
    request.requestsAlternateRoutes = NO;

    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        MKRoute *route = response.routes.lastObject;
        NSString *allSteps = [NSString new];
        for (int i = 0; i < route.steps.count; i++) {
            MKRouteStep *step = [route.steps objectAtIndex:i];
            NSString *newStepString = step.instructions;
            allSteps = [allSteps stringByAppendingString:newStepString];
            allSteps = [allSteps stringByAppendingString:@"\n\n"];
        }
        self.textView.text = allSteps;
    }];
}


@end
