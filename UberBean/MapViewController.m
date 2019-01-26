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
    
    // Default best accuracy decreased our battery life.
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    
    // How far before an update is fired
    self.locationManager.distanceFilter = 2;
    
    [self.locationManager startUpdatingLocation];
    
    
    
    // center and zoom on current location:
    
    
    
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"error!!!");
}





// a delegate member of location manager
-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray<CLLocation *> *)locations
{
   /*
    UIAlertController* myAlertCtrl;
    myAlertCtrl = [UIAlertController alertControllerWithTitle:@"Updated"
                                                      message:@"We are in new" preferredStyle:UIAlertControllerStyleAlert];
    
    [myAlertCtrl addAction:[UIAlertAction actionWithTitle:@"Ok"
                                                    style:UIAlertActionStyleCancel
                                                  handler:^(UIAlertAction * _Nonnull action)
    {
                                                      [self dismissViewControllerAnimated:true completion:nil];
                                                  }]];
    
    [self presentViewController:myAlertCtrl animated:true completion:nil];
    */
    
    NSLog(@"Updating");
    CLLocation * loc = [locations lastObject];
    
    NSLog(@"Time %@, latitude %+.6f, longitude %+.6f currentLocation accuracy %1.2f loc accuracy %1.2f timeinterval %f",
          [NSDate date],loc.coordinate.latitude,
          loc.coordinate.longitude,
          loc.horizontalAccuracy,
          loc.verticalAccuracy,
          fabs([loc.timestamp timeIntervalSinceNow])
          );
    
    
    // the update is new. Not cached
    NSTimeInterval locationAge = -[loc.timestamp timeIntervalSinceNow];
    if (locationAge > 10.0)
    {
        NSLog(@"locationAge is %1.2f", locationAge);
        return;
    }
    
    // A negative value indicates that the latitude and longitude are invalid.
    if (loc.horizontalAccuracy < 0)
    {
        NSLog(@"Horizontal Accuracy is invalid");
        // so don't move the map anywhere
        return;
    }
    
    
    // let's push the map
    if (self.currentLocation == nil || self.currentLocation.horizontalAccuracy >= loc.horizontalAccuracy)
    {
        self.currentLocation = loc;
        CLLocationCoordinate2D zoomToLocation = CLLocationCoordinate2DMake(_currentLocation.coordinate.latitude,    _currentLocation.coordinate.longitude);
        
        MKCoordinateRegion adjustedRegion = MKCoordinateRegionMakeWithDistance(zoomToLocation, 500, 500);
        
        [self.mapView setRegion:adjustedRegion animated:YES];
        
        
        // if can't get needed accuracy, let's stop this
        if (loc.horizontalAccuracy <= self.locationManager.desiredAccuracy)
        {
            if ([CLLocationManager locationServicesEnabled])
            {
                if (self.locationManager)
                {
                    [self.locationManager stopUpdatingLocation];
                    NSLog(@"Stop Regular Location Manager");
                }
            }
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    
    
    if(status == kCLAuthorizationStatusDenied){
        [self.locationManager stopUpdatingLocation];
    }else{
        [self.locationManager startUpdatingLocation];
    }
    
    
    
}


@end
