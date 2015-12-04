import UIKit

class BasicEntryCell: BaseEntryCell {
    let promptTextLabel = UILabel()
    let textInput = UITextField()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup()
    {
        //stub
        contentView.addSubview(promptTextLabel)
        contentView.addSubview(textInput)
        promptTextLabel.font = UIFont.boldSystemFontOfSize(18)
        textInput.font = UIFont.boldSystemFontOfSize(18)
        
        textInput.textAlignment = .Right
        textInput.borderStyle = .None
        cellHeight = UI.ENTRY_FIELD.BASIC_CELL_HEIGHT
        
        //Constraints
        promptTextLabel.translatesAutoresizingMaskIntoConstraints = false
        promptTextLabel.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor, constant: UI.ENTRY_FIELD.CELL_INDENT).active = true
        
        promptTextLabel.topAnchor.constraintEqualToAnchor(contentView.topAnchor).active = true
        promptTextLabel.bottomAnchor.constraintEqualToAnchor(separator.topAnchor).active = true
        
        
        promptTextLabel.trailingAnchor.constraintEqualToAnchor(textInput.leadingAnchor).active = true
        
        textInput.translatesAutoresizingMaskIntoConstraints = false
        
        textInput.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor, constant: -UI.ENTRY_FIELD.CELL_INDENT).active = true
        
        textInput.topAnchor.constraintEqualToAnchor(contentView.topAnchor).active = true
        textInput.bottomAnchor.constraintEqualToAnchor(separator.topAnchor).active = true
        
        promptTextLabel.setContentCompressionResistancePriority(1000, forAxis: .Horizontal)
        promptTextLabel.setContentHuggingPriority(1000, forAxis: .Horizontal)
    }
    
}