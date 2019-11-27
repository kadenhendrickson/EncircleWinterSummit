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
        guard let floor = floor else {return}
        buildingNameLabel.text = floor.name
        messageLabel.text = floor.rooms
        buildingImage.image = floor.map
        buildingImage.alpha = 0.75
    }
}
