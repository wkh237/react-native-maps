//
//  AIRGroundOverlayManager.m
//  AirMaps
//
//  Created by Ben Hsieh on 2016/10/31.
//  Copyright © 2016年 Christopher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridge.h"
#import "RCTConvert.h"
#import "RCTConvert+CoreLocation.h"
#import "RCTEventDispatcher.h"
#import "UIView+React.h"
#import "AIRMapMarker.h"
#import "RCTViewManager.h"
#import "AIRMapGroundOverlay.h"

#import "AIRMapGroundOverlayManager.h"

@interface AIRMapGroundOverlayManager()

@end

@implementation AIRMapGroundOverlayManager


RCT_EXPORT_MODULE()

- (UIView *)view
{
    AIRMapGroundOverlay *overlay = [AIRMapGroundOverlay new];
    return overlay;
}

RCT_EXPORT_VIEW_PROPERTY(url, NSString)

RCT_EXPORT_VIEW_PROPERTY(coordinates, AIRMapCoordinateArray)

@end
