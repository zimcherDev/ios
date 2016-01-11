import UIKit
import Foundation

protocol TextFieldWithPlaceholderAlignment: UITextFieldDelegate {
    var placeholderAlignment: NSTextAlignment {get set}
    var editingTextAlignment: NSTextAlignment {get set}
}

extension TextFieldWithPlaceholderAlignment {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let isEmpty = range.length == (textField.text ?? "" as NSString).length
            && range.location == 0
            && (string as NSString).length == 0
                
        textField.textAlignment = isEmpty ? placeholderAlignment : editingTextAlignment
        return true
    }
    
}

class TextField: UITextField{
    var placeholderAlignment: NSTextAlignment = NSTextAlignment.Left
    //var editingTextAlignment: NSTextAlignment = NSTextAlignment.Right { didSet { textAlignment = placeholderAlignment } }
    
    override func drawPlaceholderInRect(rect: CGRect) {
        let style = NSMutableParagraphStyle()
        style.alignment = placeholderAlignment
        style.lineBreakMode = .ByTruncatingTail
    }
}