//
//  KVMyAnnotation.m
//  MySimpleMapView
//
//  Created by Klaus Villaca on 14/05/2014.
//  Copyright (c) 2014 Klaus Villaca. All rights reserved.
//

#import "KVMyAnnotation.h"

@implementation KVMyAnnotation

-(id)initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates
                   title:(NSString *)paramTitle
                subTitle:(NSString *)paramSubTitle
{
    self = [super init];
    if (self != nil) {
        _coordinate = paramCoordinates;
        _title = paramTitle;
        _subtitle = paramSubTitle;
    }
    return self;
}

@end
