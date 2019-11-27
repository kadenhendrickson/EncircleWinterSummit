//
//  MapDetailViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/23/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class MapDetailViewController: UIViewController {
    
    var workshop: Workshop?

    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var encircleHouseImage: UIImageView!
    @IBOutlet weak var roomNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews(){
        guard let workshop = workshop else {return}
        self.view.backgroundColor = .black
        mapImage.image = UIImage(named: workshop.map)
        encircleHouseImage.image = UIImage(named: "EncircleHouse")
        roomNameLabel.text = workshop.room
        roomNameLabel.textColor = .white
    }
}
