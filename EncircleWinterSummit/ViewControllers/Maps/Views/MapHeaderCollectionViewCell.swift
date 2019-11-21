//
//  MapHeaderCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/12/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class MapHeaderCollectionViewCell: UICollectionViewCell {
    
    var floor: Floor? {
        didSet {
            setupViews()

        }
    }
    
    @IBOutlet weak var buildingNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var buildingImage: UIImageView!
    
    func setupViews(){
        buildingNameLabel.text = floor?.name
        buildingNameLabel.textColor = .white
        buildingNameLabel.font = UIFont(name: FontNames.playfairBold, size: 36)
        messageLabel.text = floor?.rooms
        messageLabel.textColor = .white
        messageLabel.font = UIFont(name: FontNames.futuraBook, size: 16)
        buildingImage.image = floor?.map
    }
    
    
}
