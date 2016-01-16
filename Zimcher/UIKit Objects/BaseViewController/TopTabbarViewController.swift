//
//  TopTabbarViewController.swift
//  Zimcher
//
//  Created by Tianhang Yang on 1/16/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit

class TopTabbarViewController: ZCViewController, TopTabbarDatasource, TopTabbarDelegate {

    
    private(set) var topTabbar:TopTabbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTopTabbar()
    }
    
    private func setUpTopTabbar() {
        let topTabbarTemp = TopTabbar.init(frame: CGRectZero)
        self.topTabbar = topTabbarTemp
        self.topTabbar!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.topTabbar!)
        self.topTabbar!.pinHeight()
        NSLayoutConstraint.pinSubView(self.topTabbar!, superView: self.view, topPin: false, botPin: false, leadingPin: true, trailingPin: true)
        let topPin = NSLayoutConstraint.init(item: self.topTabbar!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.topLayoutGuide, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        topPin.active = true
        self.topTabbar!.datasource = self
        self.topTabbar!.delegate = self
    }
    
    //for overide purpose
    func numberOfItems() -> Int {
        return 0
    }
    
    func topTabbar(topTabbar: TopTabbar, didSelectItemAtIndex index: Int) {
        
    }
    
    func topTabbar(topTabbar: TopTabbar, titleForItemAtIndex index: Int) -> String? {
        return ""
    }

    
}
