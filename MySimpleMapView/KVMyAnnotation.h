//
//  KVMyAnnotation.h
//  MySimpleMapView
//
//  Created by Klaus Villaca on 14/05/2014.
//  Copyright (c) 2014 Klaus Villaca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface KVMyAnnotation : NSObject<MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *subtitle;

-(id) initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates
                    title:(NSString *)paramTitle
                 subTitle:(NSString *)paramSubTitle;

@end
