//
//  ViewController.m
//  UberBean
//
//  Created by jason harrison on 2019-01-25.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.mapView setShowsUserLocation:YES];
    
    self.mapView.delegate = self;
    self.locationManager.delegate = self;
    
    
    self.mapView.mapType = MKMapTypeStandard;
    


   
    self.locationManager = [[CLLocationManager alloc] init];
    
    // Default best accuracy decreased our battery life.
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    
    // How far before an update is fired
    self.locationManager.distanceFilter = 2;
    
    [self.locationManager startUpdatingLocation];

    
    
    
    
}


@end
