//
//  InvalidInputAlert.swift
//  SwiftPort
//
//  Created by Weiyu Huang on 11/15/15.
//  Copyright © 2015 Kappa. All rights reserved.
//

import Foundation
import UIKit

protocol TopAlertViewContainer: class {
    var topLayoutGuide: UILayoutSupport { get }
    var view: UIView! {get}
}

extension TopAlertViewContainer{
    func showTopAlert(alertString: String)
    {
        let v = TopAlertView.sharedView
        
        if !view.subviews.contains(v) {
            view.addSubview(v)
            topLayoutGuide.bottomAnchor.constraintEqualToAnchor(v.topAnchor).active = true
            view.leadingAnchor.constraintEqualToAnchor(v.leadingAnchor).active = true
            view.trailingAnchor.constraintEqualToAnchor(v.trailingAnchor).active = true
        }
        
        v.show(alertString)
    }
    
 
}




class TopAlertView: UIView {
    
    @IBOutlet weak var alertTextLabel: UILabel!
    
    static let sharedView = NSBundle.mainBundle().loadNibNamed("AlertPanel", owner: nil, options: nil).first as! TopAlertView
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        translatesAutoresizingMaskIntoConstraints = false
        alpha = 0
    }
    
    
    func show(alertString: String, backgroundColor: UIColor? = nil, duration: Double = 2)
    {
        if let color = backgroundColor {
            TopAlertView.sharedView.backgroundColor = color
        }
        
        alertTextLabel.text = alertString
        UIView.animateWithDuration(0.5, delay: 0, options: [.BeginFromCurrentState], animations: {[weak self] in self?.alpha = 0.9 })
            { [weak self] _ in
                UIView.animateWithDuration(0.5, delay: duration, options: [.BeginFromCurrentState], animations: {
                    self?.alpha = 0
                    }) {   _ in /*self?.removeFromSuperview()*/ }
            }
    }
}