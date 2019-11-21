//
//  FloorDetailViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/17/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class FloorDetailViewController: UIViewController {
    
    var floor: Floor?
    
    @IBOutlet weak var floorMapImage: UIImageView!
    @IBOutlet weak var buildingNameTextLabel: UILabel!
    @IBOutlet weak var floorNumberTextLabel: UILabel!
    @IBOutlet weak var roomsTextLabel: UILabel!
    @IBOutlet weak var encircleHouseImage: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews(){
        self.view.backgroundColor = .black
        floorMapImage.image = floor?.map
        buildingNameTextLabel.text = buildingName()
        buildingNameTextLabel.font = UIFont(name: FontNames.playfairBold, size: 36)
        buildingNameTextLabel.textColor = .white
        floorNumberTextLabel.text = floor?.name
        floorNumberTextLabel.font = UIFont(name: FontNames.futuraBold, size: 20)
        floorNumberTextLabel.textColor = .white
        roomsTextLabel.text = floor?.rooms
        roomsTextLabel.font = UIFont(name: FontNames.futuraBook, size: 16)
        roomsTextLabel.textColor = .white
        
        encircleHouseImage.image = UIImage(named: "EncircleHouse")
    }
    
    func buildingName() -> String {
        if(FloorController.shared.building == FloorController.shared.adobeFloors) {
            return "Adobe Building"
        } else {
            return "Podium Building"
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
