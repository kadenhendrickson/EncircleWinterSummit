//
//  NoWorkshopCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/7/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class NoWorkshopCollectionViewCell: UICollectionViewCell {
    
    var indexPath: Int? {
        didSet{
            updateView()
            configureCell()
        }
    }
    
    @IBOutlet weak var workshopNumberLabel: UILabel!
    @IBOutlet weak var selectWorkshopLabel: UILabel!
    
    
    func updateView(){
        workshopNumberLabel.backgroundColor = .systemPink
        workshopNumberLabel.textColor = .white
        workshopNumberLabel.text = "Workshop \(indexPath!-1)"
        selectWorkshopLabel.text = "Select Workshop"
    }
    
    func configureCell(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height / 15
    }
}
