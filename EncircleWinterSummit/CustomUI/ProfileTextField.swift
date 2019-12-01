//
//  ProfileTextField.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/27/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class ProfileTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        updateFont(fontName: FontNames.futuraBook)
        setUpUI()
    }
    
    func setUpUI() {
        self.addCornerRadius(10)
        self.backgroundColor = .black
        self.borderStyle = .none
    }

    func updateFont(fontName: String) {
        self.font = UIFont(name: fontName, size: 16)
        self.textColor = .white
        
    }
    
    
    
}


