//
//  IntroAndOutroCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/7/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class IntroAndOutroCollectionViewCell: UICollectionViewCell {
    
    var workshop: Workshop? {
        didSet {
            setupView()
        }
    }
    
    @IBOutlet weak var sessionInfoButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    
    @IBOutlet weak var workshopNameLabel: UILabel!
    @IBOutlet weak var workshopTimeLabel: UILabel!
    @IBOutlet weak var workshopRoomLabel: UILabel!
    @IBOutlet weak var workshopDetailLabel: UILabel!
    
    func setupView(){
        guard let workshop = workshop else {return}
        workshopNameLabel.text = workshop.name
        workshopTimeLabel.text = "\(workshop.time)"
        workshopRoomLabel.text = workshop.room
        workshopDetailLabel.text = workshop.description
        sessionInfoButton.setTitle("Session Info", for: .normal)
        mapButton.setTitle("Map", for: .normal)
    }
    
    @IBAction func sessionInfoButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func mapButtonTapped(_ sender: Any) {
    }
    
    
}
