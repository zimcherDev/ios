//
//  SignUpViewController.swift
//  SwiftPort
//
//  Created by Weiyu Huang on 11/14/15.
//  Copyright © 2015 Kappa. All rights reserved.
//

import UIKit

class SignUpViewController: ViewControllerWithKBLayoutGuide, ValidationAndTopAlertView{
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
        entryField.headerFooterHeight = 0

        navigationItem.leftBarButtonItem?.title = ""
        kbLayoutGuide.topAnchor.constraintEqualToAnchor(termsView.bottomAnchor, constant: LOCAL_CONSTANT.TERMS_TO_BOTTOM).active = true
        
        entryField.feedData(generateData())
    }

    private func generateData() -> [EntryFieldData]
    {
        var r = [EntryFieldData]()
        var basic0 = BasicEntryFieldData()
        basic0.promptText = "FeelsBadMan"
        basic0.placeholderText = "I know that feel bro"
        basic0.onSubmitCallback = {[weak self] con in
            let f = (OnSubmitCallbackGenerator.TextFieldValidation(IsValid.userName))
            let r = f(con)
            if !r{
                self!.showTopAlert("alert")
            }
            return r
        }
        var basic1 = BasicEntryFieldData()
        basic1.promptText = "Hungry"
        
        r.append(basic0)
        r.append(basic1)
        r.append(basic1)
        return r
    }
    
    
    @IBAction func donePressed() {
        
        guard entryField.onSubmitCallback() else { return }
        //Networking.userRegisterWithUserJSON(payload: ["userName": nameInput.text!, "email":emailInput.text!, "password":passwordInput.text!]) { data, response, error in }
        //stub
    }
}
