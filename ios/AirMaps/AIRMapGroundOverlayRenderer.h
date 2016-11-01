//
//  AIRMapGroundOverlayRenderer.h
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
#import "AIRMap.h"
#import "RCTView.h"

@interface AIRMapGroundOverlayRenderer : MKOverlayRenderer

-(instancetype) initWithOverlay:(id<MKOverlay>)overlay imageData:(NSData *)data;


@end
