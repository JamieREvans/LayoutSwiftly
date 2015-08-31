//
//  ViewController.swift
//  LayoutSwiftly
//
//  Created by JamieREvans on 08/31/2015.
//  Copyright (c) 2015 JamieREvans. All rights reserved.
//

import UIKit
import LayoutSwiftly

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.buildUI()
    }

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
}

