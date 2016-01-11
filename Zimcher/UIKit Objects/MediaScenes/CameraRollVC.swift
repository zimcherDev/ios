//
//  CameraRollVC.swift
//  Zimcher
//
//  Created by Weiyu Huang on 1/9/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit

class CameraRollVC: UIViewController {
    @IBOutlet weak var downButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        downButton.setImage(UIImage(named: "arrow"), forState: .Normal)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}