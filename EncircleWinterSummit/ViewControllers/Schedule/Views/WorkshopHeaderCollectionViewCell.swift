//
//  WorkshopHeaderCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/19/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class WorkshopHeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var encircleHouseImage: UIImageView!
    @IBOutlet weak var workshopNumber: UILabel!
    @IBOutlet weak var timeFrameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    func setUpViews() {
        encircleHouseImage.image = UIImage(named: "EncircleHouse")
        
    }
    
    
}
