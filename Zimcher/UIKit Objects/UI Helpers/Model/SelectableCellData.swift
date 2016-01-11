import Foundation
import UIKit

protocol SelectableCellDataType {
    var onSelectCallback: ((UITableViewCell) -> Void)? {get}
}

class SelectableCellData: EntryFieldData, SelectableCellDataType {
    static let cellType = CellInitType.Class(SelectableCell.self)
    static let cellReuseIdentifier = "SELECTABLE_CELL"
    
    var promptText = ""
    var hasDisclosureArrow = true
    var placeholderText = ""
    var onSelectCallback: ((UITableViewCell) -> Void)? = nil
    
    func configureCell(cell: BaseEntryCell)
    {
        let c = cell as! SelectableCell
        c.promptTextLabel.text = promptText
        c.hasDisclosureArrow = hasDisclosureArrow
        c.placeholderText = placeholderText
        c.onSelectCallback = onSelectCallback
    }
}