//
//  SmallDetailCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 9/17/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class SmallDetailCollectionViewCell: UICollectionViewCell {
    
    var info: Info? {
        didSet{
            setUpViews()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setUpViews(){
        guard let info = info else {return}
        titleLabel.text = info.name
        descriptionLabel.text = info.description
    }
    
    func configureCell(cell: SmallDetailCollectionViewCell) {
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = cell.frame.height / 15
    }
}
