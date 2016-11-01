//
//  AIRMapGroundOverlayRenderer.m
//  AirMaps
//
//  Created by Ben Hsieh on 2016/10/31.
//  Copyright © 2016年 Christopher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIRMapGroundOverlayRenderer.h"

@interface AIRMapGroundOverlayRenderer()
{
    UIImage * overlayImage;
}
@end

@implementation AIRMapGroundOverlayRenderer

-(instancetype) initWithOverlay:(id<MKOverlay>)overlay imageData:(NSData *)data
{
    overlayImage = [UIImage imageWithData:data];
    return [self initWithOverlay:overlay];
}

- (void) drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)context
{

    CGImageRef imageReference = overlayImage.CGImage;

    MKMapRect theMapRect = [self.overlay boundingMapRect];
    CGRect theRect = [self rectForMapRect:theMapRect];
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0.0, -theRect.size.height);
    CGContextDrawImage(context, theRect, imageReference);

}

- (BOOL) canDrawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale
{
    return YES;
}

@end
