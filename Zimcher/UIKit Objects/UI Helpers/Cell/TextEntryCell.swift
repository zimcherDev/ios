import UIKit

class TextEntryCell: TextPromptEntryFieldCell {
    let textInput = UITextField()
    
    var placeholderText: String? {
        didSet {
            guard placeholderText != oldValue else { return }
            setPlaceholderTextStyle(placeholderText)
        }
    }
    
    var placeholderTextAlignment = NSTextAlignment.Left {
        didSet {
            guard placeholderTextAlignment != oldValue else { return }
            setPlaceholderTextStyle(placeholderText)
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
    
    private func setPlaceholderTextStyle(text: String?)
    {
        guard let t = text else {
            textInput.attributedPlaceholder = nil
            return }
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = placeholderTextAlignment
        let at = NSAttributedString(string: t, attributes: [NSFontAttributeName: placeholderFont, NSForegroundColorAttributeName: placeholderColor,
            NSParagraphStyleAttributeName: paraStyle])
        textInput.attributedPlaceholder = at
    }
    
    private func setup()
    {
        //stub
        contentView.addSubview(textInput)
        
        cellHeight = UI.ENTRY_FIELD.BASIC_CELL_HEIGHT
        
        setupTextinput(textInput)
        
        //Constraints
        promptTextLabel.trailingAnchor.constraintEqualToAnchor(textInput.leadingAnchor).active = true
        
        textInput.translatesAutoresizingMaskIntoConstraints = false
        
        textInput.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor, constant: -UI.ENTRY_FIELD.CELL_INDENT).active = true
        
        textInput.topAnchor.constraintEqualToAnchor(contentView.topAnchor).active = true
        textInput.bottomAnchor.constraintEqualToAnchor(separator.topAnchor).active = true
        
    }
    
    private func setupTextinput(textfield: UITextField)
    {
        textfield.textAlignment = .Right
        placeholderTextAlignment = .Left
        textfield.borderStyle = .None
        textfield.font = FONTS.SF_MEDIUM.fontWithSize(18)
        textfield.textColor = COLORSCHEME.ENTRY_FIELD.INPUT_TEXT_FG
    }
}