//
//  LoginViewController.swift
//  SwiftPort
//
//  Created by Weiyu Huang on 11/14/15.
//  Copyright © 2015 Kappa. All rights reserved.
//

import UIKit

class LoginViewController: ViewControllerWithKBLayoutGuide, TopAlertViewContainer{

    @IBOutlet weak var tableView: TableViewWithIntrinsicSize!
    
    var entryField: EntryField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //dansGame WutFace
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        
        entryField = EntryField(tableView: tableView)
        
        entryField.feedData(generateData())
    }
    
    private func generateData() -> [EntryFieldData]
    {
        let r = [ReusableTextEntryFieldData.emailEntryFieldData, ReusableTextEntryFieldData.passwordEntryFieldData]
        
        r.forEach {[unowned self] in $0.onFailCallback = self.showTopAlert }
        
        return r.map { $0 as EntryFieldData }
    }

    @IBAction func donePressed() {
        guard entryField.onSubmitCallback() else { return }
        
        //Networking.userLoginWithUserJSON(payload: <#T##Any?#>, completionHandler: <#T##responseHandler?##responseHandler?##(data: NSData?, response: NSURLResponse?, error: NSError?) -> Void#>)
    }
    
}
