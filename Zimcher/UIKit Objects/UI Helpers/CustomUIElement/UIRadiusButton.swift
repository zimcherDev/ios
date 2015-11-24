//
//  UIRadiusButton.swift
//  SwiftPort
//
//  Created by Weiyu Huang on 11/15/15.
//  Copyright © 2015 Kappa. All rights reserved.
//

import UIKit

extension UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}

class RadiusButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        cornerRadius = CONSTANT.UI.LOGIN_BUTTON_CORNER_RADIUS
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cornerRadius = CONSTANT.UI.LOGIN_BUTTON_CORNER_RADIUS
    }
}
