//
//  WorkshopCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/8/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class WorkshopCollectionViewCell: UICollectionViewCell {
    
    var workshop: Workshop? {
        didSet {
            setupViews()
        }
    }
    
    @IBOutlet weak var workshopNameLabel: UILabel!
    @IBOutlet weak var workshopRoomLabel: UILabel!
    @IBOutlet weak var workshopDescriptionLabel: UILabel!
    
    
    func setupViews(){
        workshopNameLabel.text = workshop?.name
        workshopRoomLabel.text = workshop?.room
        workshopDescriptionLabel.text = workshop?.description
    }
    
    
    @IBAction func sessionInfoButtonClicked(_ sender: Any) {
    }
    
    @IBAction func addToScheduleButtonTapped(_ sender: Any) {
    }
    
}
