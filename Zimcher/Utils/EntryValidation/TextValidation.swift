//
//  StringValidation.swift
//  SwiftPort
//
//  Created by Weiyu Huang on 10/28/15.
//  Copyright © 2015 Kappa. All rights reserved.
//

import Foundation

struct IsValid {
    typealias TextValidatorType = (String)->Bool
    private static func validationCreator(filterString: String) -> TextValidatorType
    {
        let predicate = NSPredicate(format: "SELF MATCHES %@", filterString)
        return { predicate.evaluateWithObject($0) }
    }

    static let email = IsValid.validationCreator(Validation.EMAIL_FILTER)
    static let userName = IsValid.validationCreator(Validation.USER_NAME_ALLOWED_CHARS)
    
    static func password(input: String) -> Bool
    {
        return input.characters.count > 6
    }
    
    //used for textfields etc.
    static func hasValidInput(@autoclosure text: ()->String?, @noescape validator: TextValidatorType) -> Bool
    {
        if let t = text()?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) {
            return t != "" && validator(t)
        }
        return false
    }
    
}