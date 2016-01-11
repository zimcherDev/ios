//
//  ZimsViewController.swift
//  Zimcher
//
//  Created by Weiyu Huang on 1/2/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit

class ZimsViewController: MyZimsSubVC {
    let addButton = UIButton()
    let searchButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerNib(UINib(nibName: "ZimsCell", bundle: nil), forCellReuseIdentifier: "ZimsCell")
        
        setupFloatingButtonConstraints()
        
        tableView.tableFooterView = UIView()
        //hide separators for empty cell
    }
    

    
    private func setupFloatingButtonConstraints()
    {
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setBackgroundImage(UIImage(named: "cButtonCreateAZim"), forState: .Normal)
        addButton.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: 0).active = true
        addButton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: 0).active = true
        
        addButton.widthAnchor.constraintEqualToConstant(48).active = true
        addButton.heightAnchor.constraintEqualToConstant(48).active = true
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ZimsCell", forIndexPath: indexPath)
        // Configure the cell...

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        parentViewController?.performSegueWithIdentifier("showTargetZim", sender: nil)
    }
    
}