//
//  KVViewController.m
//  MySimpleMapView
//
//  Created by Klaus Villaca on 13/05/2014.
//  Copyright (c) 2014 Klaus Villaca. All rights reserved.
//

#import "KVViewController.h"
#import "KVMyAnnotation.h"
#import <MapKit/MapKit.h>

@interface KVViewController ()

@end

@implementation KVViewController

CLLocationManager *locationManager;
CLGeocoder *geocoder;
CLPlacemark *placemark;
CLLocationCoordinate2D location;
KVMyAnnotation *annotation;

@synthesize myMapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    
    self.myMapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.myMapView.mapType = MKMapTypeSatellite;
    self.myMapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.myMapView.delegate = self;
    [self.view addSubview:self.myMapView];
    
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    [self.myMapView addAnnotation:annotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    [locationManager stopUpdatingLocation];
    location = CLLocationCoordinate2DMake(currentLocation.coordinate.latitude,
                                          currentLocation.coordinate.longitude);
    annotation = [[KVMyAnnotation alloc] initWithCoordinates:location
                                                       title:placemark.locality
                                                    subTitle:placemark.subLocality];
    
    // With Zoom
    MKCoordinateRegion mapRegion;
    mapRegion.center = location;
    mapRegion.span = MKCoordinateSpanMake(0.2, 0.2);
    [myMapView setRegion:mapRegion animated:YES];
    
    
    myMapView.showsUserLocation = YES;
    [myMapView setZoomEnabled:YES];
    
    // Without Zoom
    //    [myMapView setCenterCoordinate:location animated:YES];
    [myMapView addAnnotation:annotation];
    
    
}



-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to get your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}



@end
