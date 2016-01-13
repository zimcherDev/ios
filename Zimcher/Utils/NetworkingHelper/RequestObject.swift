//
//  RequestObject.swift
//  Zimcher
//
//  Created by Chris Yang on 1/13/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//
//TODO: use this object to construct server request


import Foundation

class RequestObject {
    var APIName: String? //APT method name (login, signup, etc)
    var requestJson: [String:String]? //requestJson that will be sent to the server
    var addtionalJson: [String: String]? //addtionalJson that used for sepecific server call
    
    init(APIName:String?, addtionalJson: [String:String]?) {
        self.setUpSharedRequestJson()
        self.APIName = APIName
        self.addtionalJson = addtionalJson
        for (key, value) in self.addtionalJson! {
            self.requestJson?.updateValue(value, forKey: key)
        }
    }
    
    //generate json that will be shared accoss all the server calls, feel free to add more that make sense
    func setUpSharedRequestJson() {
        self.requestJson = [JSON_KEY_PATH.GENERAL.APP_VERSION:Utility.getAppVerison()]
    }

}