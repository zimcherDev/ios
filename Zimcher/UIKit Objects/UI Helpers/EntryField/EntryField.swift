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
    unowned let tableView: TableViewWithIntrinsicSize
    
    var headerFooterHeight = CGFloat(0) { didSet { tableView.reloadData() } }
    var headerFooterColor = UIColor.clearColor() { didSet { tableView.reloadData() }}
    
    var datasource = [EntryFieldData]()
    
    init(tableView: TableViewWithIntrinsicSize)
    {
        self.tableView = tableView
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.scrollEnabled = false
        tableView.separatorStyle = .None
        
        //dynamic cell height
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 69
    }
    
    func feedData(data: [EntryFieldData])
    {
        datasource = data
        data.forEach(registerCell)
        tableView.reloadData()
        tableView.layoutIfNeeded()
        
        tableView.reloadData()
        tableView.updateConstraintsIfNeeded()
        
        //Don't know why but it works
    }
    
    func onSubmitCallback() -> Bool
        //stub
    {
        return datasource.flatMap { $0 as? HasOnSubmitCallback }
            .filter{ $0.cell is TextEntryCell
        } // STUB
            .reduce(true) { result, i in
                result ? i.onSubmitCallback?((i.cell as! TextEntryCell).textInput) ?? true : false }
    }
    
    private func registerCell(data: EntryFieldData)
    {
        let reuseID = data.dynamicType.cellReuseIdentifier
        switch data.dynamicType.cellType {
        case .Class(let c):
            tableView.registerClass(c, forCellReuseIdentifier: reuseID)
        case .NibName(let s):
            tableView.registerNib(UINib(nibName: s, bundle: nil), forCellReuseIdentifier: reuseID)
        }
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
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.tableView(tableView, viewForFooterInSection: section)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let type = (datasource[indexPath.row]).dynamicType
        
        let cell = tableView.dequeueReusableCellWithIdentifier(type.cellReuseIdentifier, forIndexPath: indexPath) as! BaseEntryCell
        datasource[indexPath.row].configureCell(cell)
        
        cell.hasSeparator = !isLast(indexPath)
        
        return cell
    }
    
    private func isLast(indexPath: NSIndexPath) -> Bool
    {
        return datasource.count - 1 == indexPath.row
    }
    
}