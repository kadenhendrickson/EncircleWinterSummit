//
//  ScheduleInfoButtons.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/27/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class ScheduleInfoButtons: UIButton {

 override func awakeFromNib() {
     super.awakeFromNib()
//    self.backgroundColor = .systemPink
     updateTitle(fontName: FontNames.futuraBold)
    setUpImage()
 }
 
 func updateTitle(fontName: String){
     let size: CGFloat = 16
     self.titleLabel?.font = UIFont(name: fontName, size: size)
    self.setTitleColor(.black, for: .normal)
    self.contentHorizontalAlignment = .center
     self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right:0)
    
 }

    func setUpImage(){
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 70)
        
    }

}
