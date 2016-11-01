//
//  AIRGroundOverlay.h
//  AirMaps
//
//  Created by Ben Hsieh on 2016/10/31.
//  Copyright © 2016年 Christopher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

#import "RCTConvert+MapKit.h"
#import "AIRMapCoordinate.h"
#import "RCTComponent.h"
#import "AIRMapCoordinate.h"
#import "AIRMapGroundOverlayRenderer.h"
#import "AIRMap.h"
#import "RCTView.h"

@interface AIRMapGroundOverlay : MKAnnotationView <MKOverlay>

@property (nonatomic, weak) AIRMap *map;

@property (nonatomic, strong) AIRMapGroundOverlayRenderer *renderer;

@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) NSArray<AIRMapCoordinate *> *coordinates;

#pragma mark MKOverlay protocol

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, readonly) MKMapRect boundingMapRect;
//- (BOOL)intersectsMapRect:(MKMapRect)mapRect;
- (BOOL)canReplaceMapContent;

@end
