//
//  FloorMapCollectionViewCell.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/12/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

protocol FloorMapCollectionViewCellDelegate: class {
    func viewMapButtonTapped(floor: Floor)
}

class FloorMapCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: FloorMapCollectionViewCellDelegate?
    
    var floor: Floor? {
        didSet{
            setupViews()
            configureCell(cell: self)
        }
    }
    
    @IBOutlet weak var floorNumberLabel: UILabel!
    @IBOutlet weak var roomTitleLabel: UILabel!
    @IBOutlet weak var roomNamesLabel: UILabel!
    @IBOutlet weak var coloredHeader: UIView!
    @IBOutlet weak var viewMapButton: UIButton!
    @IBOutlet weak var locationIconImage: UIImageView!
    
    func setupViews(){
        coloredHeader.backgroundColor = determineHeaderColor()
        floorNumberLabel.text = floor?.name
        floorNumberLabel.textColor = .white
        floorNumberLabel.font = UIFont(name: FontNames.futuraBold, size: 18)
        roomTitleLabel.text = "ROOMS ON THIS FLOOR:"
        roomTitleLabel.textColor = .black
        roomTitleLabel.font = UIFont(name: FontNames.futuraBold, size: 14)
        roomNamesLabel.text = floor?.rooms.uppercased()
        roomNamesLabel.font = UIFont(name: FontNames.futuraBook, size: 14)
        viewMapButton.setTitle("View Map", for: .normal)
        viewMapButton.setTitleColor(.black, for: .normal)
        viewMapButton.titleLabel?.font = UIFont(name: FontNames.futuraBold, size: 14)
        locationIconImage.image = UIImage(named: "mapIcon")
    }
    
    func configureCell(cell: FloorMapCollectionViewCell) {
          cell.layer.masksToBounds = true
          cell.layer.cornerRadius = cell.frame.height / 15
      }
    
    func determineHeaderColor() -> UIColor {
           if(FloorController.shared.building == FloorController.shared.adobeFloors){
               return .red
           } else {
               return .blue
           }
       }

    @IBAction func viewMapButtonTapped(_ sender: Any) {
        guard let floor = floor else {return}
        delegate?.viewMapButtonTapped(floor: floor)
    }
}
