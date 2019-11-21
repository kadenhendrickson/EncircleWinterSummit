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
    }
    
    func setUpViews(){
        titleLabel.text = "WELCOME TO THE 2019 ENCRICLE SUMMIT"
        descriptionLabel.text = "We're excited to have you at this year's Encircle Summit. We're excited to see you soon!"
        encircleImage.image = UIImage(named: "EncircleHouse")
        
        titleLabel.font = UIFont(name: FontNames.playfairBold, size: 36)
        titleLabel.textColor  = .white

        descriptionLabel.font = UIFont(name: FontNames.futuraBook, size: 16)
        descriptionLabel.textColor = .white
    }
    
}
