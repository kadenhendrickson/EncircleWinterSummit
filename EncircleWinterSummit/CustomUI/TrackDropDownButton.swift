//
//  TrackDropDownButton.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/25/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class TrackDropDownButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        updateTitle(fontName: FontNames.futuraBook)
    }
    
    func updateTitle(fontName: String){
        let size: CGFloat = 22
        self.titleLabel?.font = UIFont(name: fontName, size: size)
        self.setTitleColor(.white, for: .normal)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right:0)
    }

}
