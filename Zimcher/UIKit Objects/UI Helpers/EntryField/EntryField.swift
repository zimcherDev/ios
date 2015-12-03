//
//  TableViwWithIntrinsicSize.swift
//  Zimcher
//
//  Created by Weiyu Huang on 12/3/15.
//  Copyright © 2015 Zimcher. All rights reserved.
//

import UIKit

class TableViewWithIntrinsicSize: UITableView {
    override func reloadData() {
        invalidateIntrinsicContentSize()
        super.reloadData()
    }
    
    override func intrinsicContentSize() -> CGSize {
        layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: contentSize.height)
    }
}


class EntryField: NSObject, UITableViewDelegate, UITableViewDataSource {
    let tableView = TableViewWithIntrinsicSize()
    
    var headerFooterHeight = CGFloat(0) { didSet { tableView.reloadData() } }
    var headerFooterColor = UIColor.clearColor() { didSet { tableView.reloadData() }}
    
    var datasource = [Int]()
    
    func setup()
    {
        tableView.delegate = self
        tableView.scrollEnabled = false
        tableView.separatorStyle = .None
        
        //dynamic cell height
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return headerFooterHeight
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerFooterHeight
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = headerFooterColor
        return v
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    }
    
}