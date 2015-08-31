# LayoutSwiftly

[![CI Status](http://img.shields.io/travis/JamieREvans/LayoutSwiftly.svg?style=flat)](https://travis-ci.org/JamieREvans/LayoutSwiftly)
[![Version](https://img.shields.io/cocoapods/v/LayoutSwiftly.svg?style=flat)](http://cocoapods.org/pods/LayoutSwiftly)
[![License](https://img.shields.io/cocoapods/l/LayoutSwiftly.svg?style=flat)](http://cocoapods.org/pods/LayoutSwiftly)
[![Platform](https://img.shields.io/cocoapods/p/LayoutSwiftly.svg?style=flat)](http://cocoapods.org/pods/LayoutSwiftly)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

``` objective-c
import LayoutSwiftly

private func buildUI()
{
    let redView = self.addViewWithColor(UIColor.redColor())
    let purpleView = self.addViewWithColor(UIColor.purpleColor())
    let greenView = self.addViewWithColor(UIColor.greenColor())

    self.view.alignViewsHorizontally([redView, greenView, purpleView], horizontalSeparations: [50.0, 50.0, -20.0, 20.0], widths: [50.0, 30.0, 0.0])
    self.view.alignViewsVertically([redView, greenView], verticalSeparations: [150.0, 20.0], heights: [50.0, 100.0])
    self.view.alignViewsVertically([redView, purpleView], verticalSeparations: [10.0], heights: [0.0, 50.0])
}

private func addViewWithColor(color: UIColor) -> UIView
{
    let coloredView = UIView()
    coloredView.translatesAutoresizingMaskIntoConstraints = false;
    coloredView.backgroundColor = color
    self.view.addSubview(coloredView);

    return coloredView
}
```

![example](http://i.imgur.com/FGt9lbC.png, "Example from code")

## Requirements

## Installation

LayoutSwiftly is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LayoutSwiftly"
```

## Author

JamieREvans, jamie.riley.evans@gmail.com

## License

LayoutSwiftly is available under the MIT license. See the LICENSE file for more info.
