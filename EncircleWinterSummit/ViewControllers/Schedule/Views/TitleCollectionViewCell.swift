//
//  TitleCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/8/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var encircleHouseImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    func setUpViews(){
        titleLabel.text = "SCHEDULE"
        titleLabel.textColor = .black
        titleLabel.font =  UIFont(name: FontNames.playfairBold, size: 36)
        descriptionLabel.text = "Get ready for an amazing day!"
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont(name: FontNames.futuraBook, size: 16)
//        encircleHouseImage.image = UIImage(named: "EncircleHouse")
    }
    
}
