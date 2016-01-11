//
//  SignUpViewController.swift
//  SwiftPort
//
//  Created by Weiyu Huang on 11/14/15.
//  Copyright © 2015 Kappa. All rights reserved.
//

import UIKit

class SignUpViewController: ViewControllerWithKBLayoutGuide, TopAlertViewContainer{
    @IBOutlet weak var termsView: UIStackView!

    @IBOutlet weak var tableView: TableViewWithIntrinsicSize!
    
    struct LOCAL_CONSTANT {
        static let TERMS_TO_BOTTOM: CGFloat = 15
    }
    
    var entryField: EntryField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        entryField = EntryField(tableView: tableView)

        navigationItem.leftBarButtonItem?.title = ""
        kbLayoutGuide.topAnchor.constraintEqualToAnchor(termsView.bottomAnchor, constant: LOCAL_CONSTANT.TERMS_TO_BOTTOM).active = true
        
        entryField.feedData(generateData())
    }

    private func generateData() -> [EntryFieldData]
    {
        let r = [ReusableTextEntryFieldData.usernameEntryFieldData, ReusableTextEntryFieldData.emailEntryFieldData, ReusableTextEntryFieldData.passwordEntryFieldData]
        
        r.forEach {[weak self] in $0.onFailCallback = self!.showTopAlert }
        return r.map { $0 as EntryFieldData }
    }
    
    
    @IBAction func donePressed() {
        
        guard entryField.onSubmitCallback() else { return }
        //Networking.userRegisterWithUserJSON(payload: ["userName": nameInput.text!, "email":emailInput.text!, "password":passwordInput.text!]) { data, response, error in }
        //stub
    }
}
