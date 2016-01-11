//
//  ForgetPasswordViewController.swift
//  SwiftPort
//
//  Created by Weiyu Huang on 11/15/15.
//  Copyright © 2015 Kappa. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: ViewControllerWithKBLayoutGuide, TopAlertViewContainer{

    @IBOutlet weak var tableView: TableViewWithIntrinsicSize!
    
    var entryField: EntryField!
    override func viewDidLoad() {
        super.viewDidLoad()

        entryField = EntryField(tableView: tableView)
        entryField.feedData(generateData())
    }
    
    private func generateData() -> [EntryFieldData]
    {
        let data = ReusableTextEntryFieldData.emailEntryFieldData
        data.onFailCallback = showTopAlert
        
        return [data]
    }
    
    @IBAction func donePressed() {
        guard entryField.onSubmitCallback() else { return }
    }
}
