//
//  AIRGroundOverlay.m
//  AirMaps
//
//  Created by Ben Hsieh on 2016/10/31.
//  Copyright © 2016年 Christopher. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AIRMapGroundOverlayRenderer.h"
#import "AIRMapGroundOverlay.h"
#import "UIView+React.h"

@implementation AIRMapGroundOverlay {
    NSData * overlayImage;
}


- (void)setUrl:(NSString *)url
{
    _url = url;
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        
        if (error)
        {
        }
        else
        {
            overlayImage = data;
            [self update];
        }
    }];
    
}


- (void)setCoordinates:(NSArray<AIRMapCoordinate *> *)coordinates
{
    _coordinates = coordinates;
    [self update];
}

- (void) update
{
    self.renderer = [[AIRMapGroundOverlayRenderer alloc] initWithOverlay:self imageData:overlayImage];
    if(_map == nil) return;
    [_map removeOverlay:self];
    [_map addOverlay:self];
}


#pragma mark MKOverlay implementation

- (CLLocationCoordinate2D) coordinate
{
    if(_coordinates)
    {
        float xcenter = (_coordinates[0].coordinate.latitude + _coordinates[1].coordinate.latitude)/2;
        float ycenter = (_coordinates[0].coordinate.longitude + _coordinates[1].coordinate.longitude)/2;
        return CLLocationCoordinate2DMake(xcenter, ycenter);
    }
    else
    {
        return _map.centerCoordinate;
    }
}

- (MKMapRect) boundingMapRect
{
    if(_coordinates == nil)
        return _map.visibleMapRect;
    float xcenter = (_coordinates[0].coordinate.latitude + _coordinates[1].coordinate.latitude)/2;
    float ycenter = (_coordinates[0].coordinate.longitude + _coordinates[1].coordinate.longitude)/2;
    
    float xdelta = fabs(_coordinates[0].coordinate.latitude - _coordinates[1].coordinate.latitude);
    float ydelta = fabs(_coordinates[0].coordinate.longitude - _coordinates[1].coordinate.longitude);;

    MKMapPoint a = MKMapPointForCoordinate(CLLocationCoordinate2DMake(
                                                                      xcenter + xdelta / 2,
                                                                      ycenter - ydelta / 2));
    MKMapPoint b = MKMapPointForCoordinate(CLLocationCoordinate2DMake(
                                                                      xcenter - xdelta / 2,
                                                                      ycenter + ydelta / 2));
    MKMapRect rect = MKMapRectMake(MIN(a.x,b.x), MIN(a.y,b.y), ABS(a.x-b.x), ABS(a.y-b.y));
    return rect;
}


@end
