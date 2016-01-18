//
//  NavigationVCwithStatusBarHidden.swift
//  Zimcher
//
//  Created by Weiyu Huang on 1/9/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit

class NavigationVCwithStatusBarHidden: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationBar.setBackgroundImage(UIImage.imageFromColorAndSize(UIColor.blackColor().colorWithAlphaComponent(0.5), size: CGSize(width: 1, height: 64)), forBarMetrics: UIBarMetrics.Default)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
}
