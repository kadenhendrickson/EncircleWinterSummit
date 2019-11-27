//
//  HomepageHeaderCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/16/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class HomepageHeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var encircleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
//        let overlay = UIView(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height))
//        overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
//        self.encircleImage.addSubview(overlay)
    }
    
    func setUpViews(){
        titleLabel.text = "WELCOME TO THE 2019 ENCRICLE SUMMIT"
        descriptionLabel.text = "We're excited to have you at this year's Encircle Summit. We're excited to see you soon!"
        encircleImage.image = UIImage(named: "EncircleHouse")
        encircleImage.backgroundColor = .black
        encircleImage.alpha = 0.75
    }
    
    
}
