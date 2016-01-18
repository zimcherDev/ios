//
//  NSLayoutConstraintConvenience.swift
//  Zimcher
//
//  Created by Tianhang Yang on 1/16/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//
//
//  NSlayoutConstraintConvenience.swift
//  Zimcher
//
//  Created by Tianhang Yang on 1/15/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    //make sure subview is added to superview before call the methods
    
    class func pinSubView (subView:UIView, superView:UIView) {
        NSLayoutConstraint.pinSubView(subView, superView: superView, topPin: true, botPin: true, leadingPin: true, trailingPin: true)
    }
    
    class func pinSubView (subView:UIView, superView:UIView, topPin:Bool, botPin:Bool, leadingPin:Bool, trailingPin:Bool) {
        NSLayoutConstraint.pinSubView(subView, superView: superView, topPin: topPin, topConstant: 0, botPin: botPin, botConstant: 0, leadingPin: leadingPin, leadingConstant: 0, trailingPin: trailingPin, trailingConstant: 0)
    }
    
    class func pinSubView (subView:UIView, superView:UIView, topPin:Bool, topConstant:CGFloat, botPin:Bool,botConstant:CGFloat, leadingPin:Bool, leadingConstant:CGFloat, trailingPin:Bool, trailingConstant:CGFloat) {
        if (topPin) {
            let top = NSLayoutConstraint.init(item: subView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: superView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: topConstant)
            top.active = true
        }
        if (botPin) {
            let bot = NSLayoutConstraint.init(item: subView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: superView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: botConstant)
            bot.active = true
        }
        if (leadingPin) {
            let leading = NSLayoutConstraint.init(item: subView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: superView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: leadingConstant)
            leading.active = true
        }
        if (trailingPin) {
            let trailing = NSLayoutConstraint.init(item: subView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: superView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: trailingConstant)
            trailing.active = true;
        }
    }
    
}