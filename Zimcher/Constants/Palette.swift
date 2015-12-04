import UIKit

extension UIColor
{
    convenience init(r: UInt8, g: UInt8, b: UInt8) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

struct PALETTE {
   static let BLUE = UIColor(red: 96/256.0, green: 111/256.0, blue: 214/256.0, alpha: 1)
    static let DARK_BLUE = UIColor(red: 22/256.0, green: 24/256.0, blue: 45/256.0, alpha: 1)
    static let SLATE_BLUE = UIColor(red: 95/256.0, green: 108/256.0, blue: 217/256.0, alpha: 1)
    static let CORN_FLOWER_BLUE = UIColor(red: 95/256.0, green: 108/256.0, blue: 217/256.0, alpha: 1)
    static let WARM_GARY = UIColor(r: 145, g: 145, b: 145)
}