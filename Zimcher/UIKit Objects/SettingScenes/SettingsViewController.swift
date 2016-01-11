
import UIKit

@IBDesignable class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: TableViewWithIntrinsicSize!
    var entryField: EntryField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = COLORSCHEME.SETTINGS.BG
        
        tableView.backgroundColor = UIColor.whiteColor()
        entryField = EntryField(tableView: tableView)
        entryField.headerFooterHeight = 1
        entryField.headerFooterColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        entryField.feedData(generateData())
    }
    
    private func generateData() -> [EntryFieldData]
    {
        let e0 = ReusableTextEntryFieldData.usernameEntryFieldData
        let e1 = TextEntryFieldData()
        e1.promptText = "Intro"
        
        let e2 = SelectableCellData()
        e2.promptText = "Email"
        
        let e3 = SelectableCellData()
        e3.promptText = "Password"
        
        let e4 = FacebookCellData()
        return [e0, e1, e2, e3, e4]
    }
}