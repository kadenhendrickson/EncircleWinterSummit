//
//  Extensions.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/23/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

extension Date{
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .none
        return dateFormatter.string(from: self)
 
    }
}

extension Notification.Name {
    static let appLaunched = Notification.Name("appLaunched")
}

extension UIView {
    func addCornerRadius(_  radius: CGFloat = 4) {
        self.layer.cornerRadius = radius
    }
}
