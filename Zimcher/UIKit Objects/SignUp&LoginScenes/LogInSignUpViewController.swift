//
//  LogInSignUpViewController.swift
//  SwiftPort
//
//  Created by Weiyu Huang on 11/15/15.
//  Copyright © 2015 Kappa. All rights reserved.
//

import UIKit

class LogInSignUpViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(UIImage.imageFromColorAndSize(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3), size: CGSize(width: 1, height: 1)), forBarMetrics: .Default)
        
        navigationBar.translucent = true
        navigationBar.shadowImage = UIImage()
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }

}
