import Foundation
import UIKit
class FacebookCellData: EntryFieldData {
    static let cellType = CellInitType.Class(FacebookCell.self)
    static let cellReuseIdentifier = "FACEBOOK_CELL"
    
    var promptText = "Facebook"
    
    func configureCell(cell: BaseEntryCell)
    {
        let c = cell as! FacebookCell
        c.promptTextLabel.text = promptText
    }
}