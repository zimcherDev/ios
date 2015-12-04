import UIKit

class BaseEntryCell: UITableViewCell {
    var separator = UIView()
    
    var hasSeparator = true {
        didSet {
            guard hasSeparator != oldValue else { return }
            separatorHeight.constant = hasSeparator ? UI.ENTRY_FIELD.SEPARATOR_HEIGHT : 0
            //layoutIfNeeded()
        }
    }
    private var separatorHeight: NSLayoutConstraint!
    
    var cellHeight: CGFloat? {
        didSet {
            guard cellHeight != oldValue else { return }
            cellHeightConstraint.active = false
            if let h = cellHeight {
                cellHeightConstraint.constant = h + separatorHeight.constant
                cellHeightConstraint.active = true
            }
            //layoutIfNeeded()
        }
    }
    private var cellHeightConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        defalutSetup()
    }
   
    private func defalutSetup()
    {
        selectionStyle = .None
    }
    
    private func setup()
    {
        separator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(separator)
        
        separator.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor, constant: UI.ENTRY_FIELD.SEPARATOR_INDENT).active = true
        separator.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor, constant: -UI.ENTRY_FIELD.SEPARATOR_INDENT).active = true
        separator.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor).active = true
        separator.backgroundColor = COLORSCHEME.ENTRY_FIELD.SEPARATOR_BG
        
        separatorHeight = separator.heightAnchor.constraintEqualToConstant(2)
        separatorHeight.active = true
        
        cellHeightConstraint = contentView.heightAnchor.constraintEqualToConstant(0)
        //cellHeightConstraint.priority = 999
        //WTF Apple?
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
}
