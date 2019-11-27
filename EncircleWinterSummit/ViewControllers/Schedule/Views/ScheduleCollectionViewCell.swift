//
//  ScheduleCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/7/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

protocol ScheduleCollectionViewCellDelegate: class {
    func scheduleSessionInfoButtonTapped(workshop: Workshop)
    func scheduleMapButtonTapped(workshop: Workshop)
}

class ScheduleCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ScheduleCollectionViewCellDelegate?
    var workshop: Workshop? {
        didSet{
            setUpViews()
            configureCell()
        }
    }
    
    
    @IBOutlet weak var nameLabelBackgroundColor: UIView!
    @IBOutlet weak var workshopNameLabel: UILabel!
    @IBOutlet weak var workshopTitleLabel: UILabel!
    @IBOutlet weak var workshopTimeLabel: UILabel!
    @IBOutlet weak var workshopRoomLabel: UILabel!
    
    
    @IBAction func mapButtonTapped(_ sender: Any) {
        guard let workshop = workshop else {return}
        delegate?.scheduleMapButtonTapped(workshop: workshop)
    }
    
    @IBAction func sessionInfoButtonTapped(_ sender: Any) {
        guard let workshop = workshop else {return}
        delegate?.scheduleSessionInfoButtonTapped(workshop: workshop)
    }
    
    
    func setUpViews(){
        guard let workshop = workshop else {return}
        workshopNameLabel.text = workshop.name.uppercased()
        workshopTitleLabel.text = workshop.title.uppercased()
        workshopTimeLabel.text = workshop.time.toString()
        workshopRoomLabel.text = "Room: \(workshop.room)"
    }
     
    func configureCell(){
         self.layer.masksToBounds = true
         self.layer.cornerRadius = 10
     }
}
