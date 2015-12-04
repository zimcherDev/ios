import Foundation
import UIKit

enum CellInitType {
    case NibName(String)
    case Class(BaseEntryCell.Type)
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

typealias OnSubmitCallbackType = (UIControl) -> Bool

protocol HasOnSubmitCallback {
    weak var cell: BaseEntryCell! {get}
    var onSubmitCallback: OnSubmitCallbackType? { get }
}

struct BasicEntryFieldData: EntryFieldData, HasOnSubmitCallback {
    static let cellType = CellInitType.Class(BasicEntryCell.self)
    static let cellReuseIdentifier = "BASIC_ENTRY_CELL"
    
    weak var cell: BaseEntryCell!
    
    var promptText = ""
    var placeholderText = ""
    
    var controlEventCallbacks = [ControlEventCallback]()
    var onSubmitCallback: OnSubmitCallbackType?
    
    mutating func configureCell(cell: BaseEntryCell) {
        let c = cell as! BasicEntryCell
        self.cell = c
        c.promptTextLabel.text = promptText
        c.textInput.placeholder = placeholderText
        c.cellHeight = 49
    }
        
}
