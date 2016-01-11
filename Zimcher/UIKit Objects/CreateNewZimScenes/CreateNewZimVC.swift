//
//  CreateNewZimVC.swift
//  Zimcher
//
//  Created by Weiyu Huang on 1/3/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import UIKit

class CreateNewZimVC: ViewControllerWithKBLayoutGuide {

    @IBOutlet weak var tableView: TableViewWithIntrinsicSize!
    
    var entryField: EntryField!
    override func viewDidLoad() {
        super.viewDidLoad()

        entryField = EntryField(tableView: tableView)
        entryField.headerFooterHeight = 1
        entryField.headerFooterColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        
        entryField.feedData(generateData())
    }
    
    private func generateData() -> [EntryFieldData]
    {
        let data0 = ValidatableTextEntryFieldData()
        data0.promptText = "Zim name"
        data0.placeholderText = "e.g. Hooping, Skateboarding"
        data0.keyboardType = .Default
        //data.textValidator = IsValid.email
        //data.invalidAlertMessage = "Please enter a valid email address"
        
        let data1 = ValidatableTextEntryFieldData()
        data1.promptText = "Description"
        data1.placeholderText = ""
        data1.keyboardType = .Default
        
        let data2 = SelectableCellData()
        data2.promptText = "Publicity"
        data2.hasDisclosureArrow = false
        data2.onSelectCallback = {[weak self] cell in
            self?.alert(cell)
            cell.setSelected(false, animated: true)
        }
        
        let r: [EntryFieldData] = [data0, data1, data2]
        
        //r.forEach {[unowned self] in $0.onFailCallback = self.showTopAlert }
        
        return r
    }
    
    private func alert(cell: UITableViewCell)
    {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        func alertActionHandler(action: UIAlertAction)
        {
            guard let c = cell as? SelectableCell else { return }
            //stub!
            c.placeholderText = action.title
        }
        
        let actions = [
            UIAlertAction(title: "Public", style: .Default, handler: alertActionHandler),
            UIAlertAction(title: "Request required", style: .Default, handler: alertActionHandler),
            UIAlertAction(title: "Invitation only", style: .Default, handler: alertActionHandler),
            UIAlertAction(title: "Private", style: .Default, handler: alertActionHandler),
            UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        ]
        actions.forEach(alertController.addAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    
}