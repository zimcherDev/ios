//
//  MyZimsSubVC.swift
//  Zimcher
//
//  Created by Weiyu Huang on 1/2/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit

class MyZimsSubVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func setupTableView()
    {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
        tableView.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor).active = true
        tableView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor).active = true
        tableView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor).active = true
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("override")
        let cell = tableView.dequeueReusableCellWithIdentifier("ReuseID", forIndexPath: indexPath)
        return cell
    }
}