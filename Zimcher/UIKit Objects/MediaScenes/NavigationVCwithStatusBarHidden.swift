//
//  NavigationVCwithStatusBarHidden.swift
//  Zimcher
//
//  Created by Weiyu Huang on 1/9/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit

class NavigationVCwithStatusBarHidden: UINavigationController {
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
}
