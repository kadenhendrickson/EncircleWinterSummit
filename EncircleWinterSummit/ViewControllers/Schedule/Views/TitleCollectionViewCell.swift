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
        titleLabel.text = "Schedule"
        descriptionLabel.text = "Get ready for an amazing day!"
        encircleHouseImage.image = UIImage(named: "EncircleHouse")
        encircleHouseImage.alpha = 0.75
    }
    
    func configureCell(height: CGFloat, width: CGFloat){
        self.bounds.size.height = height
        self.bounds.size.width = width
    }
    
}
