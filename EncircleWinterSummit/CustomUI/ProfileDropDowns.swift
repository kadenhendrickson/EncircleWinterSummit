//
//  ProfileDropDowns.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/27/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class ProfileDropDowns: UIButton {

       override func awakeFromNib() {
        super.awakeFromNib()
        updateTitle(fontName: FontNames.futuraBook)
    }
    
    func updateTitle(fontName: String){
        let size: CGFloat = 16
        self.titleLabel?.font = UIFont(name: fontName, size: size)
        self.setTitleColor(.white, for: .normal)
        self.contentHorizontalAlignment = .left
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0 , bottom: 0, right:0)
    }

}
