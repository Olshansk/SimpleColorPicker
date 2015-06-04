//
//  SimpleColorPickerView.m
//  SimpleColorPicker
//
//  Created by Daniel Olshansky on 5/31/15.
//  Copyright (c) 2015 olshansky. All rights reserved.
//

#import "SimpleColorPickerView.h"

#define BORDER_WIDTH 1.0f
#define CORNER_RADIUS 6.0f

@interface SimpleColorPickerView()
@property (nonatomic, strong) UIImageView *colorMapImageView;
@end

@implementation SimpleColorPickerView

- (id)initWithFrame:(CGRect)frame withDidPickColorBlock:(SimpleColorPickerDidPickColorBlock)didPickColorBlock
{
    self = [super initWithFrame:frame];
    
    if (self != nil){
        self.didPickColorBlock = didPickColorBlock;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self prepareColorMapView];
}

#pragma mark - Prepare Views

- (void)prepareColorMapView
{
    _colorMapImageView = [[UIImageView alloc] initWithImage:[self drawGradientinBounds]];
    _colorMapImageView.frame = self.bounds;
    _colorMapImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _colorMapImageView.layer.borderWidth = BORDER_WIDTH;
    _colorMapImageView.layer.cornerRadius = CORNER_RADIUS;
    _colorMapImageView.layer.masksToBounds = YES;
    
    [self addSubview:_colorMapImageView];
}

#pragma mark - Touch Handling methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches){
        [self dispatchTouchEvent:[touch locationInView:self]];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches){
        [self dispatchTouchEvent:[touch locationInView:self]];
    }
}

- (void)dispatchTouchEvent:(CGPoint)position
{
    if (CGRectContainsPoint(_colorMapImageView.frame,position)){
        [self _updateColorToTouchAtPosition:position];
    }
}

#pragma mark - Private methods

- (void)_updateColorToTouchAtPosition:(CGPoint)position
{
    CGFloat hue = (position.y - _colorMapImageView.frame.origin.y) / _colorMapImageView.frame.size.height;
    UIColor *color = [UIColor colorWithHue:hue saturation:1.0f brightness:1.0f alpha:1.0f];
    if (_didPickColorBlock != nil) {
        _didPickColorBlock(color);
    }
}

#pragma mark - Creating the color map

- (UIImage*)drawGradientinBounds
{
    CGRect rect = self.bounds;
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    NSMutableArray* mutableLocations = [[NSMutableArray alloc] init];
    NSMutableArray* mutableColors = [[NSMutableArray alloc] init];
    
    for (float i = 0; i <= 1.0f; i += 0.01f) {
        [mutableLocations addObject:[NSNumber numberWithFloat:i]];
        UIColor* color = [UIColor colorWithHue: (i / 1.0f) saturation: 1.0f brightness: 1.0f alpha: 1.0f];
        [mutableColors addObject:(__bridge id)color.CGColor];
    }
    
    CGFloat locations[[mutableLocations count]];
    [self getFloatsArrayFromNSArray:mutableLocations withFloatsArray:locations];
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)mutableColors, locations);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen]) {
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            CGContextConcatCTM(context, [window transform]);
            CGContextTranslateCTM(context,
                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
            if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
                [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
            } else {
                [window.layer renderInContext:context];
            }
            CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
            CGContextRestoreGState(context);
        }
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return image;
    
}

- (void)getFloatsArrayFromNSArray:(NSMutableArray*)valuesArray withFloatsArray:(CGFloat*)floatsArray {
    long count = [valuesArray count];
    for (int i = 0; i < count; i++) {
        floatsArray[i] = [[valuesArray objectAtIndex:i] floatValue];
    }
}

@end