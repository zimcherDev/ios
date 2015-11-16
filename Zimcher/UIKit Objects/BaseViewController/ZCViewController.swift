//
//  ZCViewController.swift
//  Zimcher
//
//  Created by Tianhang Yang on 11/16/15.
//  Copyright © 2015 Zimcher. All rights reserved.
//
//
//  Discription: This class is for future implementtion of functionalities that share across the app
//                  all view controller class should be at least a one level decendent of this class


import UIKit


//TODO: please add all view controller as the subclass of this class
class ZCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
