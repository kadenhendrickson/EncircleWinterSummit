//
//  WorkshopHeaderCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/19/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class WorkshopHeaderCollectionViewCell: UICollectionViewCell {
    
    var workshop: Workshop? {
        didSet{
            setUpViews()
        }
    }
    
    @IBOutlet weak var encircleHouseImage: UIImageView!
    @IBOutlet weak var workshopNumber: UILabel!
    @IBOutlet weak var timeFrameLabel: UILabel!

    func setUpViews() {
        guard let workshop = workshop else {return}
        encircleHouseImage.image = UIImage(named: "EncircleHouse")
        encircleHouseImage.alpha = 0.75
        workshopNumber.text = workshop.name
        workshopNumber.textColor = .white
        timeFrameLabel.text = workshop.time.toString()
        timeFrameLabel.textColor = .white
    }
}
