//
//  FeedsViewController.swift
//  Zimcher
//
//  Created by Weiyu Huang on 1/2/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit

class FeedsViewController: MyZimsSubVC {
    
    let cellNibName = "FeedsCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerNib(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellNibName)
        
        tableView.separatorStyle = .None
        tableView.backgroundColor = PALETTE.PALE_GRAY.colorWithAlphaComponent(0.8)
        view.backgroundColor = tableView.backgroundColor
    }

    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellNibName, forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }

}