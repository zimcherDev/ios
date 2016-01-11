//
//  FacebookCell.swift
//  Zimcher
//
//  Created by Weiyu Huang on 12/10/15.
//  Copyright © 2015 Zimcher. All rights reserved.
//

import Foundation
import UIKit

class FacebookCell: TextPromptEntryFieldCell {
    let facebookButton = RadiusButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup()
    {
        selectionStyle = .None
        cellHeight = UI.ENTRY_FIELD.BASIC_CELL_HEIGHT
        
        facebookButton.setTitle("connect", forState: .Normal)
        facebookButton.titleLabel?.font = FONTS.SF_MEDIUM.fontWithSize(14)
        contentView.addSubview(facebookButton)
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.centerYAnchor.constraintEqualToAnchor(contentView.centerYAnchor).active = true
        facebookButton.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor, constant: -13).active = true
        facebookButton.heightAnchor.constraintEqualToConstant(26).active = true
        facebookButton.widthAnchor.constraintEqualToConstant(69).active = true
        
    }
}