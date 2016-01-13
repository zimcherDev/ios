//
//  Utility.swift
//  Zimcher
//
//  Created by Chris Yang on 1/13/16.
//  Copyright © 2016 Zimcher. All rights reserved.
//

import Foundation

class Utility {
    static func getAppVerison()->String! {
        return NSBundle.mainBundle().infoDictionary?[CONSTANTS.VERSION_GETTER_STRING] as? String;
    }
}