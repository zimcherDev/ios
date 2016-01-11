import UIKit

class TextPromptEntryFieldCell: BaseEntryCell {
    let promptTextLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup()
    {
        contentView.addSubview(promptTextLabel)
        setupPrompt(promptTextLabel)
        
        promptTextLabel.translatesAutoresizingMaskIntoConstraints = false
        promptTextLabel.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor, constant: UI.ENTRY_FIELD.CELL_INDENT).active = true
        
        promptTextLabel.topAnchor.constraintEqualToAnchor(contentView.topAnchor).active = true
        promptTextLabel.bottomAnchor.constraintEqualToAnchor(separator.topAnchor).active = true
        
        
        //default
        promptTextLabel.setContentCompressionResistancePriority(1000, forAxis: .Horizontal)
        promptTextLabel.setContentHuggingPriority(1000, forAxis: .Horizontal)
    }
    
    private func setupPrompt(prompt: UILabel)
    {
        prompt.textColor = COLORSCHEME.ENTRY_FIELD.PROMPT_TEXT_FG
        prompt.font =  FONTS.SF_SEMIBOLD.fontWithSize(18)
    }
}

