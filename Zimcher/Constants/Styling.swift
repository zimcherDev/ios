import UIKit

struct COLORSCHEME{
    struct TAB_BAR {
        static let TINT = PALETTE.CORN_FLOWER_BLUE
        static let BAR_TINT = UIColor.whiteColor()
    }
    
    struct ENTRY_FIELD {
        static let SEPARATOR_BG = PALETTE.WARM_GRAY.colorWithAlphaComponent(0.6)
        static let HEADER_FOOTER_BG = UIColor.blackColor().colorWithAlphaComponent(0.2)
        
        static let PROMPT_TEXT_FG = PALETTE.DARK
        static let PLACEHOLDER_TEXT_FG = PALETTE.WARM_GRAY
        static let INPUT_TEXT_FG = UIColor.blackColor()
        
    }
    
    struct SETTINGS {
        static let BG = PALETTE.PALE_GRAY
        static let NAVIGATION_BAR_BG = PALETTE.CORN_FLOWER_BLUE
    }
    
    struct ROUNDEDCORNER_BUTTON {
        static let TINT = UIColor.whiteColor()
        static let BG = PALETTE.CORN_FLOWER_BLUE.colorWithAlphaComponent(0.9)
    }
    
    struct NAVIGATION_BAR {
        static let TINT = UIColor.whiteColor()
    }
    
    struct MYZIMS {
        static let TABBAR = PALETTE.CORN_FLOWER_BLUE
        static let NAVIGATION_BAR = PALETTE.DARK
    }
}

struct UI {
    struct ENTRY_FIELD {
        static let SEPARATOR_HEIGHT = CGFloat(1)
        static let SEPARATOR_INDENT = CGFloat(15)
        
        static let CELL_INDENT = 2 + SEPARATOR_INDENT
        static let BASIC_CELL_HEIGHT = CGFloat(49)
        
    }
    static let LOGIN_BUTTON_CORNER_RADIUS = CGFloat(3)
    
    struct MYZIMS {
        static let TABBAR_HEIGHT = CGFloat(45)
        static let TABBAR_BORDER_HEIGHT = CGFloat(4)
    }
    
    struct CAMERA_ROLL {
        static let CELL_SIZE = CGSize(width: 88, height: 88)
    }
}

struct FONTS {
    static let SF_SEMIBOLD = UIFont(name: "SFUIDisplay-Semibold", size: 16)!
    static let SF_MEDIUM = UIFont(name: "SFUIDisplay-Medium", size: 16)!
}