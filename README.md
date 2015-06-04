# SimpleColorPicker

[![CI Status](http://img.shields.io/travis/Daniel Olshansky/SimpleColorPicker.svg?style=flat)](https://travis-ci.org/Daniel Olshansky/SimpleColorPicker)
[![Version](https://img.shields.io/cocoapods/v/SimpleColorPicker.svg?style=flat)](http://cocoapods.org/pods/SimpleColorPicker)
[![License](https://img.shields.io/cocoapods/l/SimpleColorPicker.svg?style=flat)](http://cocoapods.org/pods/SimpleColorPicker)
[![Platform](https://img.shields.io/cocoapods/p/SimpleColorPicker.svg?style=flat)](http://cocoapods.org/pods/SimpleColorPicker)

## What is it

SimpleColorPicker is a very simple, vertical, snapchat-like, color picker for iOS.

![Alt text](https://github.com/Olshansk/SimpleColorPicker/blob/master/Example/SimpleColorPicker.gif "SimpleColorPicker Example")

## Installation

SimpleColorPicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SimpleColorPicker"
```

## Usage

### Import
```objective-c
#import "SimpleColorPickerView.h"
```

### Initialize
```objective-c
SimpleColorPickerView *simpleColorPickerView = [[SimpleColorPickerView alloc] initWithFrame:yourRect withDidPickColorBlock:^(UIColor *color) {
  // Your code here
}];
```

### Add
```objective-c
  [yourView addSubview:simpleColorPickerView];
```

## Example Project
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Daniel Olshansky, olshansky.daniel@gmail.com

## License

SimpleColorPicker is available under the MIT license. See the LICENSE file for more info.
