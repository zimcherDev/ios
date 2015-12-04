import UIKit

struct COLORSCHEME{
    struct TAB_BAR {
        static let TINT = UIColor.whiteColor()
        static let BAR_TINT = PALETTE.DARK_BLUE
    }
    
    struct ENTRY_FIELD {
        static let SEPARATOR_BG = PALETTE.WARM_GARY.colorWithAlphaComponent(0.6)
        static let HEADER_FOOTER_BG = UIColor.blackColor().colorWithAlphaComponent(0.2)
    }
}

struct UI {
    struct ENTRY_FIELD {
        static let SEPARATOR_HEIGHT = CGFloat(2)
        static let SEPARATOR_INDENT = CGFloat(15)
        
        static let CELL_INDENT = 2 + SEPARATOR_INDENT
        static let BASIC_CELL_HEIGHT = CGFloat(49)
    }
    static let LOGIN_BUTTON_CORNER_RADIUS = CGFloat(3)
}