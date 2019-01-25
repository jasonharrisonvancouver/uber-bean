//
//  ViewController.h
//  UberBean
//
//  Created by jason harrison on 2019-01-25.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface MapViewController : UIViewController< MKMapViewDelegate, CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *currentLocation;



@end

