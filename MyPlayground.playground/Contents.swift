//: Playground - noun: a place where people can play

import UIKit
import Photos

let date = NSDate()
let components = NSCalendar.currentCalendar().componentsInTimeZone(NSTimeZone(abbreviation: "UTC")!, fromDate: date)
let timeStampString = "\(components.year)-\(components.month)-\(components.day) \(components.hour):\(components.minute):\(components.second)"
