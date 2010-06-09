//
//  MKMapView+IGTools.h
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 9.6.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (IGTools)

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate zoomLevel:(NSUInteger)zoomLevel animated:(BOOL)animated;


@end 