# XCStepper

[![CI Status](https://img.shields.io/travis/butterflyXX/XCStepper.svg?style=flat)](https://travis-ci.org/butterflyXX/XCStepper)
[![Version](https://img.shields.io/cocoapods/v/XCStepper.svg?style=flat)](https://cocoapods.org/pods/XCStepper)
[![License](https://img.shields.io/cocoapods/l/XCStepper.svg?style=flat)](https://cocoapods.org/pods/XCStepper)
[![Platform](https://img.shields.io/cocoapods/p/XCStepper.svg?style=flat)](https://cocoapods.org/pods/XCStepper)

## Example

1.这个是一个自定义的Stepper(进步器),里面封装了步进器功能,及进退的按钮.但是请注意,框架里面没有对按钮进行布局,需要用户根据自己的需求自行布局.
2.用户在使用的时候,需要继承'XCStepper',之后可以添加其他的控件在上面,切记这里需要布局一下提供的两个按钮 upButton downButton;
3.按钮的点击自动对value进行加减,并会通过block把操作传递出来,用户可以自定义'除步'进之外的操作;
4.demo里面有具体的使用案例,请下载查看

## Requirements
[![](https://github.com/butterflyXX/LXCSource/blob/master/XCStepper/1.gif)


## Installation

XCStepper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XCStepper'
```

## Author

butterflyXX, liuxiaochen1991@icloud.com

## License

XCStepper is available under the MIT license. See the LICENSE file for more info.
