//
//  Extensions.swift
//  SwiftPort
//
//  Created by Weiyu Huang on 11/14/15.
//  Copyright © 2015 Kappa. All rights reserved.
//

import Foundation
import UIKit
extension UIImage {
    static func imageFromColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRectMake(0, 0, size.width, size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    static func imageFromView(view: UIView) -> UIImage
    {
        UIGraphicsBeginImageContext(view.bounds.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    func changeOrientation(orientation: UIImageOrientation) -> UIImage
    {
        return UIImage(CGImage: CGImage!, scale: 1, orientation: orientation)
    }
    
}

