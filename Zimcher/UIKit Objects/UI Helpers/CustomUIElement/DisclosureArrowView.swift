//
//  DisclosureArrowView.swift
//  Zimcher
//
//  Created by Weiyu Huang on 12/9/15.
//  Copyright © 2015 Zimcher. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DisclosureArrowView: UIView {
    override func drawRect(rect: CGRect) {
        let p = UIBezierPath()
        p.moveToPoint(rect.origin)
        p.addLineToPoint(CGPoint(x: rect.maxX, y: (rect.minY + rect.maxY)/2))
        p.addLineToPoint(CGPoint(x: rect.minX, y: rect.maxY))
        self.tintColor.setStroke()
        p.stroke()
    }
}