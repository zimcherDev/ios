import Foundation
import UIKit

enum CellInitType {
    case NibName(String)
    case Class(BaseEntryCell.Type)
    
    /*
    func cellClass() -> BaseEntryCell.Type
    {
        switch self {
        case .Class(let x): return x
        case .NibName(let n):
            //let n = UINib(nibName: n, bundle: nil)
            //return n.instantiateWithOwner(nil, options: nil).first!.dynamicType
            return BaseEntryCell.self
        }
    }*/
}

protocol EntryFieldData {
    static var cellType: CellInitType {get}
    static var cellReuseIdentifier: String {get}
    mutating func configureCell(cell: BaseEntryCell)
}

struct ControlEventCallback {
    typealias functionType = (UIControl) -> Void
    var target: UIControl!
    var controlEvents: UIControlEvents!
    var callback: functionType!
}

// MARK: callbacks
typealias OnSubmitCallbackType = (UIControl) -> Bool

protocol HasOnSubmitCallback {
    weak var cell: BaseEntryCell! {get}
    var onSubmitCallback: OnSubmitCallbackType? { get }
}

protocol HasOnSelectCallback {
    var onSelectCallback: ((Void) -> Void) { get }
}

protocol TextPromptEntryFieldData: EntryFieldData
{
    var promptText: String {get set}
}

class TextEntryFieldData: TextPromptEntryFieldData, HasOnSubmitCallback {
    static let cellType = CellInitType.Class(TextEntryCell.self)
    static let cellReuseIdentifier = "TEXT_ENTRY_CELL"
    
    weak var cell: BaseEntryCell!
    
    var promptText = ""
    var placeholderText = ""
    var keyboardType = UIKeyboardType.Default
    var clearbuttonMode = UITextFieldViewMode.WhileEditing
    var isPassword = false
    
    var controlEventCallbacks = [ControlEventCallback]()
    var onSubmitCallback: OnSubmitCallbackType?
    
    func configureCell(cell: BaseEntryCell)
    {
        let c = cell as! TextEntryCell
        self.cell = c
        c.promptTextLabel.text = promptText
        c.placeholderText = placeholderText
        c.textInput.keyboardType = keyboardType
        c.textInput.clearButtonMode = clearbuttonMode
        c.textInput.secureTextEntry = isPassword
        c.cellHeight = 49
    }
        
}

protocol ValidatableTextEntry {
    var invalidAlertMessage: String {get}
    var textValidator: IsValid.TextValidatorType {get}
    var onFailCallback: (String) -> Void {get set}
    func validate(@autoclosure text: ()->String?) -> Bool
}

extension ValidatableTextEntry {
    func validate(@autoclosure text: ()->String?) -> Bool{
        let r = IsValid.hasValidInput(text, validator: textValidator)
        if !r { onFailCallback(invalidAlertMessage) }
        return r
    }
}

class ValidatableTextEntryFieldData: TextEntryFieldData, ValidatableTextEntry {
    var textValidator = IsValid.userName
    var invalidAlertMessage = "Invalid Input"
    var onFailCallback: ((String) -> Void) = {(s: String) -> Void in print(s)}
    
    override var onSubmitCallback: OnSubmitCallbackType? {
        get {
            return { control in
                let t = (control as! UITextField)
                return self.validate(t.text)
            }
        }
        set { assertionFailure("Sanity --") }
    }
}


struct ReusableTextEntryFieldData {
    static var emailEntryFieldData: ValidatableTextEntryFieldData  {
        let data = ValidatableTextEntryFieldData()
        data.promptText = "Email"
        data.placeholderText = "your email address"
        data.keyboardType = .EmailAddress
        data.textValidator = IsValid.email
        data.invalidAlertMessage = "Please enter a valid email address"
        return data
    }
    
    static var usernameEntryFieldData: ValidatableTextEntryFieldData {
        let data = ValidatableTextEntryFieldData()
        data.promptText = "Nickname"
        data.placeholderText = "name shown in Zimcher"
        data.textValidator = IsValid.userName
        data.invalidAlertMessage = "Please enter a valid username"
        return data
    }
    
    static var passwordEntryFieldData: ValidatableTextEntryFieldData  {
        let data = ValidatableTextEntryFieldData()
        data.promptText = "password"
        data.placeholderText = "at least 6 characters"
        data.isPassword = true
        data.textValidator = IsValid.password
        data.invalidAlertMessage = "Please enter a valid password"
        return data
    }
    
}
