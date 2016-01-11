//
//  TabBarViewController.swift
//  SwiftPort
//
//  Created by Weiyu Huang on 11/13/15.
//  Copyright © 2015 Kappa. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //UITabBar.appearance().selectionIndicatorImage = UIImage.imageFromColorAndSize(UIColor.whiteColor(), size: CGSizeMake(200, tabBar.frame.size.height))
        
        tabBar.tintColor = COLORSCHEME.TAB_BAR.TINT
        tabBar.barTintColor = COLORSCHEME.TAB_BAR.BAR_TINT
        
        tabBar.items?.forEach {item in
            item.setTitleTextAttributes([NSFontAttributeName: FONTS.SF_MEDIUM.fontWithSize(12)], forState: .Normal)
        }
    }

}
