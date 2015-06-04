//
//  OLSViewController.m
//  SimpleColorPicker
//
//  Created by Daniel Olshansky on 05/31/2015.
//  Copyright (c) 2014 Daniel Olshansky. All rights reserved.
//

#import "OLSViewController.h"


#import <SimpleColorPicker/SimpleColorPickerView.h>

#define FEEDBACK_VIEW_WIDTH 200
#define FEEDBACK_VIEW_HEIGHT 200

#define COLOR_PICKER_MARGIN_TOP 20
#define COLOR_PICKER_MARGIN_RIGHT 10
#define COLOR_PICKER_WIDTH 20
#define COLOR_PICKER_HEIGHT 150

@interface OLSViewController ()

@property (nonatomic, strong) UIView *feedbackView;
@property (nonatomic, strong) SimpleColorPickerView *simpleColorPickerView;

@end

@implementation OLSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect feedbackViewRect = CGRectZero;
    feedbackViewRect.size = CGSizeMake(FEEDBACK_VIEW_WIDTH, FEEDBACK_VIEW_HEIGHT);
    
    _feedbackView = [[UIView alloc] initWithFrame:feedbackViewRect];
    _feedbackView.center = self.view.center;
    
    CGRect simpleColorPickerRect = CGRectZero;
    simpleColorPickerRect.origin = CGPointMake(self.view.frame.size.width - COLOR_PICKER_WIDTH - COLOR_PICKER_MARGIN_RIGHT, COLOR_PICKER_MARGIN_TOP);
    simpleColorPickerRect.size = CGSizeMake(COLOR_PICKER_WIDTH, COLOR_PICKER_HEIGHT);
    
    _simpleColorPickerView = [[SimpleColorPickerView alloc] initWithFrame:simpleColorPickerRect withDidPickColorBlock:^(UIColor *color) {
        [_feedbackView setBackgroundColor:color];
    }];
    
    
    [self.view addSubview:_feedbackView];
    [self.view addSubview:_simpleColorPickerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
