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
    @IBOutlet weak var arrowButton: UIImageView!
    
    func setUpViews(){
        guard let info = info else {return}
        titleLabel.text = info.name
        descriptionLabel.text = info.description
        arrowButton.image = UIImage(named: "arrow")
        
//        titleLabel.font = UIFont(name: FontNames.futuraBold, size: 20)
//        titleLabel.textColor = .black
//       
//        descriptionLabel.font = UIFont(name: FontNames.futuraBook, size: 12)
//        descriptionLabel.textColor = .black
//        
    }
    
    func configureCell(cell: SmallDetailCollectionViewCell) {
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = cell.frame.height / 15
    }
}
