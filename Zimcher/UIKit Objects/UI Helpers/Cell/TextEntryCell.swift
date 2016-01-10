import UIKit

class BasicEntryCell: BaseEntryCell {
    let promptTextLabel = UILabel()
    let textInput = UITextField()
    
    var placeholderText: String? {
        didSet {
            guard placeholderText != oldValue else { return }
            guard let t = placeholderText else {
                textInput.attributedPlaceholder = nil
                return }
            let at = NSAttributedString(string: t, attributes: [NSFontAttributeName: placeholderFont, NSForegroundColorAttributeName: placeholderColor])
            textInput.attributedPlaceholder = at
        }
    }
    
    private let placeholderColor = COLORSCHEME.ENTRY_FIELD.PLACEHOLDER_TEXT_FG
    private let placeholderFont = FONTS.SF_MEDIUM.fontWithSize(18)
    
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
        
        cellHeight = UI.ENTRY_FIELD.BASIC_CELL_HEIGHT
        
        setupPrompt(promptTextLabel)
        setupTextinput(textInput)
        
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
    
    private func setupPrompt(prompt: UILabel)
    {
        prompt.textColor = COLORSCHEME.ENTRY_FIELD.PROMPT_TEXT_FG
        prompt.font =  FONTS.SF_SEMIBOLD.fontWithSize(18)
    }
    
    private func setupTextinput(textfield: UITextField)
    {
        textfield.textAlignment = .Right
        textfield.borderStyle = .None
        textfield.font = FONTS.SF_MEDIUM.fontWithSize(18)
        textfield.textColor = COLORSCHEME.ENTRY_FIELD.INPUT_TEXT_FG
    }
}