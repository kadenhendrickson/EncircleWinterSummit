//
//  HeaderCellDescriptionLabel.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/25/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class HeaderCellDescriptionLabel: UILabel {

     override func awakeFromNib() {
        super.awakeFromNib()
        updateFontTo(fontName: FontNames.futuraBook)
    }
    
    func updateFontTo(fontName: String) {
        let size: CGFloat = 18
        self.font = UIFont(name: fontName, size: size)
        self.textColor = .white
    }

}
