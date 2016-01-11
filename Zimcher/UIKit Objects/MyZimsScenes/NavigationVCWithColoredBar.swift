//
//  NavigationVCWithColoredBar.swift
//  Zimcher
//
//  Created by Weiyu Huang on 12/28/15.
//  Copyright © 2015 Zimcher. All rights reserved.
//

import UIKit

class NavigationVCWithColoredBar: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.setBackgroundImage(UIImage.imageFromColorAndSize(COLORSCHEME.MYZIMS.NAVIGATION_BAR, size: CGSize(width: 1, height: 1)), forBarMetrics: .Default)
        
        navigationBar.translucent = false
        navigationBar.shadowImage = UIImage()
        
        navigationBar.titleTextAttributes = [NSFontAttributeName: FONTS.SF_MEDIUM.fontWithSize(20), NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationBar.tintColor = UIColor.whiteColor()
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }

}
