//
//  KVViewController.h
//  MySimpleMapView
//
//  Created by Klaus Villaca on 13/05/2014.
//  Copyright (c) 2014 Klaus Villaca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface KVViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) MKMapView *myMapView;


@end
