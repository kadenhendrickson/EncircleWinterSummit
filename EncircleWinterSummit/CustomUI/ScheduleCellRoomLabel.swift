//
//  ScheduleCellRoomLabel.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/27/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class ScheduleCellRoomLabel: UILabel {

     override func awakeFromNib() {
          super.awakeFromNib()
          updateFontTo(fontName: FontNames.futuraBook)
      }
      
      func updateFontTo(fontName: String) {
          let size: CGFloat = 17
          self.font = UIFont(name: fontName, size: size)
          self.textColor = .black
      }
}
