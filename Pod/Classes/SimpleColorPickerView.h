//
//  SimpleColorPickerView.h
//  SimpleColorPicker
//
//  Created by Daniel Olshansky on 5/31/15.
//  Copyright (c) 2015 olshansky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SimpleColorPickerDidPickColorBlock)(UIColor *color);

@interface SimpleColorPickerView : UIView

@property (nonatomic, strong) SimpleColorPickerDidPickColorBlock didPickColorBlock;

- (id)initWithFrame:(CGRect)frame withDidPickColorBlock:(SimpleColorPickerDidPickColorBlock)didPickColorBlock;

@end
