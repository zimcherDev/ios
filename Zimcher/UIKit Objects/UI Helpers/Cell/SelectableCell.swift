import UIKit

class SelectableCell: TextEntryCell {
    var hasDisclosureArrow = true {
        didSet {
            guard hasDisclosureArrow != oldValue else { return }
            if hasDisclosureArrow {
                setupDisclosureArrow()
            } else {
                disclosureArrow.removeFromSuperview()
            }
        }
    }
        
    let disclosureArrow = DisclosureArrowView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    var onSelectCallback: ((UITableViewCell) -> Void)?  = nil

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup()
    {
        textInput.enabled = false
        selectionStyle = .Default
        cellHeight = UI.ENTRY_FIELD.BASIC_CELL_HEIGHT
        setupDisclosureArrow()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        guard selected else { return }
        
        onSelectCallback?(self)
        //setSelected(false, animated: animated)
    }
    
    private func setupDisclosureArrow()
    {
        contentView.addSubview(disclosureArrow)
        disclosureArrow.tintColor = COLORSCHEME.ENTRY_FIELD.PLACEHOLDER_TEXT_FG
        
        disclosureArrow.backgroundColor = UIColor.clearColor()
        disclosureArrow.translatesAutoresizingMaskIntoConstraints = false
        disclosureArrow.widthAnchor.constraintEqualToConstant(7).active = true
        disclosureArrow.heightAnchor.constraintEqualToConstant(12.2).active = true
        
        disclosureArrow.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor, constant: -UI.ENTRY_FIELD.SEPARATOR_INDENT).active = true
        
        disclosureArrow.centerYAnchor.constraintEqualToAnchor(contentView.centerYAnchor).active = true
        disclosureArrow.topAnchor.constraintGreaterThanOrEqualToAnchor(topAnchor).active = true
        disclosureArrow.bottomAnchor.constraintLessThanOrEqualToAnchor(separator.topAnchor).active = true
    }
}

