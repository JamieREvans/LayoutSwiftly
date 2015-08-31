//
//  UIView+Autolayout.swift
//  Autolayout
//
//  Created by Jamie Evans on 2015-08-12.
//  Copyright © 2015 JamieREvans. All rights reserved.
//

import UIKit

extension UIView
{
    /**
    See documentation of alignViewsWithDirection

    - parameter views: The views to layout - currently a maximum of 52 views can be laid out - but really, how many do you need?

    - parameter horizontalSeparations: The separations between the views and possibly initial and ending padding from the first and last views and the superview. The number of separations should be **views.count - 1 <= separations <= views.count + 1**.

    - parameter widths: The widths of each view. There should be an equal number of widths and views. Pass **0.0** if you don't want to set a width for the view.
    */
    public func alignViewsHorizontally(views: [UIView], horizontalSeparations: [CGFloat], widths: [CGFloat])
    {
        self.alignViewsWithDirection("H", views: views, separations: horizontalSeparations, sizes: widths)
    }

    /**
    See documentation of alignViewsWithDirection

    - parameter views: The views to layout - currently a maximum of 52 views can be laid out - but really, how many do you need?

    - parameter verticalSeparations: The separations between the views and possibly initial and ending padding from the first and last views and the superview. The number of separations should be **views.count - 1 <= separations <= views.count + 1**.

    - parameter heights: The heights of each view. There should be an equal number of heights and views. Pass **0.0** if you don't want to set a heights for the view.
    */
    public func alignViewsVertically(views: [UIView], verticalSeparations: [CGFloat], heights: [CGFloat])
    {
        self.alignViewsWithDirection("V", views: views, separations: verticalSeparations, sizes: heights)
    }

    /**
    Lays out views to a superview (self) and / or to each other. If there are less separations than views, the views are only given constraints on each other. If there are an equal number of views and separations, the views are also given a leading constaint on the superview. If there are more separations than views, the views will be constrained completely on the superview - either the superview or one of the views should have an undefined size.

    - parameter direction: Determines the direction used in the visual autolayout string. Pass **"H"** for a horizontal layout and **"V"** for a vertical layout.

    - parameter views: The views to layout. These views should already be added to self. Currently a maximum of 52 views can be laid out - but really, how many do you need?

    - parameter separations: The separations between the views and possibly initial and ending padding from the first and last views and the superview. The number of separations should be **views.count - 1 <= separations <= views.count + 1**.

    - parameter sizes: The sizes of each view. There should be an equal number of sizes and views. Pass **0.0** if you don't want to set a size for the view.
    */
    private func alignViewsWithDirection(direction: String, views: [UIView], separations: [CGFloat], sizes: [CGFloat])
    {
        var visualLayoutString: String = "\(direction):"
        var viewMap = [String : AnyObject]();

        if separations.count >= views.count
        {
            visualLayoutString += "|-\(String.numberString(separations.first!))-"
        }

        for index in 0...views.count - 1
        {
            // Make view names be characters A...z
            let viewName = String.characterStringFromIndex(index)
            viewMap[viewName] = views[index]

            // Add view string
            visualLayoutString += "[\(viewName)"

            // Add width if it's greater than 0
            let width = sizes[index]
            if width > 0
            {
                visualLayoutString += String.numberString(width)
            }

            // Close view tag and add spacing
            visualLayoutString += "]"

            // Add trailing spacing
            let trailingSpacingIndex = index + 1
            if trailingSpacingIndex < separations.count
            {
                visualLayoutString += "-\(String.numberString(separations[trailingSpacingIndex]))"
            }

            if index < views.count - 1
            {
                visualLayoutString += "-"
            }
        }

        if separations.count > views.count
        {
            visualLayoutString += "-|"
        }

        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(visualLayoutString, options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: nil, views: viewMap))
    }
}

extension String
{
    private static func numberString(number: AnyObject) -> String
    {
        return "(\(number))"
    }

    private static func characterStringFromIndex(index: Int) -> String
    {
        return String(UnicodeScalar(65 + index))
    }
}
