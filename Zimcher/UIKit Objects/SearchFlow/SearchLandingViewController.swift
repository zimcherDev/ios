//
//  SearchLandingViewController.swift
//  Zimcher
//
//  Created by Tianhang Yang on 1/15/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit

class SearchLandingViewController: TopTabbarViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        // Do any additional setup after loading the view.
    }

    func setUpView() {

    }

    override func numberOfItems() -> Int {
        return 3
    }
    
    override func topTabbar(topTabbar: TopTabbar, titleForItemAtIndex index: Int) -> String? {
        return "title"
    }
    
    override func topTabbar(topTabbar: TopTabbar, didSelectItemAtIndex index: Int) {
        print("\(index)")
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
