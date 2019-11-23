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
            configureCell()
        }
    }
    
    @IBOutlet weak var workshopNameLabel: UILabel!
    @IBOutlet weak var workshopRoomLabel: UILabel!
    @IBOutlet weak var workshopDescriptionLabel: UILabel!
    
    
    func setupViews(){
        workshopNameLabel.text = workshop?.title
        workshopRoomLabel.text = workshop?.room
        workshopDescriptionLabel.text = workshop?.description
    }
    
    func configureCell(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height / 15
    }
    
    
    @IBAction func sessionInfoButtonClicked(_ sender: Any) {
    }
    
    @IBAction func addToScheduleButtonTapped(_ sender: Any) {
    }
    
}
