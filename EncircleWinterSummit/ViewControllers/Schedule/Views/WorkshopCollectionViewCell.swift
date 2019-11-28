//
//  WorkshopCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/8/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

protocol WorkshopCollectionViewCellDelegate: class {
    func addToScheduleButtonTapped()
    func sessionInfoButtonTapped(workshop: Workshop)
}

class WorkshopCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: WorkshopCollectionViewCellDelegate?
    
    var workshop: Workshop? {
        didSet {
            setupViews()
            configureCell()
        }
    }
    
    @IBOutlet weak var workshopNameLabel: UILabel!
    @IBOutlet weak var workshopRoomLabel: UILabel!
    @IBOutlet weak var workshopDescriptionLabel: UILabel!
    @IBOutlet weak var coloredBackgroundView: UIView!
    
    
    func setupViews(){
        guard let  workshop = workshop else {return}
        workshopNameLabel.text = workshop.title.uppercased()
        workshopRoomLabel.text = "Room: \(workshop.room)"
        workshopDescriptionLabel.text = workshop.description
        coloredBackgroundView.backgroundColor = setColorScheme()
    }
    
    func configureCell(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
    }
    
    func setColorScheme() -> UIColor{
        switch UserController.shared.currentUser?.trackPreference{
        case .youth:
            return .prideBlue
        case .youngAdult:
            return .prideRed
        case .adult:
            return .pridePink
        case .parent:
            return .pridePurple
        case .educator:
            return .prideGreen
        default:
            return .clear
        }
    }
    
    
    @IBAction func sessionInfoButtonClicked(_ sender: UIButton) {
        guard let workshop = workshop else {return}
        delegate?.sessionInfoButtonTapped(workshop: workshop)
        
    }
    
    @IBAction func addToScheduleButtonTapped(_ sender: Any) {
        guard let workshop = workshop else {return}
        switch workshop.name{
        case  "Workshop 1":
            UserController.shared.addWorkshopToUserList(at: 1, workshop: workshop)
        case "Workshop 2":
            UserController.shared.addWorkshopToUserList(at: 2, workshop: workshop)
        case "Workshop 3":
            UserController.shared.addWorkshopToUserList(at: 3, workshop: workshop)
        case  "Workshop 4":
            UserController.shared.addWorkshopToUserList(at: 4, workshop: workshop)
        default:
            print("There shouldn't be anything WITH THIS TITLE")
        }
        delegate?.addToScheduleButtonTapped()
    }
    
}
