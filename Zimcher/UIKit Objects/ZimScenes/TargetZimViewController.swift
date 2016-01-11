//
//  TargetZimViewController.swift
//  Zimcher
//
//  Created by Weiyu Huang on 1/3/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit

class TargetZimViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!

    let cellNibName = "FeedsCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationBar.title = "Apple Fan"
        
        setupTableView()
    }
    
    private func setupTableView()
    {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellNibName)
        
        tableView.separatorStyle = .None
        tableView.backgroundColor = PALETTE.PALE_GRAY.colorWithAlphaComponent(0.8)
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        view.backgroundColor = tableView.backgroundColor
    }

    @IBAction func backPressed(sender: UIBarButtonItem) {
        parentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellNibName, forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showSinglePost", sender: nil)
    }

}