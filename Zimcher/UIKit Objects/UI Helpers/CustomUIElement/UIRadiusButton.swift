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

@IBDesignable class RadiusButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup()
    {
        cornerRadius = UI.LOGIN_BUTTON_CORNER_RADIUS
        setupDefault()
    }
    private func setupDefault()
    {
        tintColor = COLORSCHEME.ROUNDEDCORNER_BUTTON.TINT
        backgroundColor = COLORSCHEME.ROUNDEDCORNER_BUTTON.BG
    }
}
