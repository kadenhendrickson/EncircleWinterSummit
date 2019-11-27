//
//  IntroAndOutroCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/7/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

protocol IntroAndOutroCollectionViewCellDelegate: class {
    func sessionInfoButtonTapped(workshop: Workshop)
    func mapButtonTapped(workshop: Workshop)
}

class IntroAndOutroCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: IntroAndOutroCollectionViewCellDelegate?
    
    var workshop: Workshop? {
        didSet {
            setupView()
            configureCell()
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
        workshopNameLabel.text = workshop.title.uppercased()
        workshopTimeLabel.text = workshop.time.toString()
        workshopRoomLabel.text = ("Room: \(workshop.room)")
        workshopDetailLabel.text = workshop.description
        sessionInfoButton.setTitle("Session Info", for: .normal)
        mapButton.setTitle("Map", for: .normal)
    }
    
   func configureCell(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
    }
    
    @IBAction func sessionInfoButtonTapped(_ sender: Any) {
        print("Okay, I was tapped")
        guard let workshop = workshop else {return}
        print("Im about to tell the delegate what to do")
        delegate?.sessionInfoButtonTapped(workshop: workshop)
        print("I just told the delegate what to do")
        
    }
    
    @IBAction func mapButtonTapped(_ sender: Any) {
        guard let workshop = workshop else {return}
        delegate?.mapButtonTapped(workshop: workshop)
    }
    
    
}
