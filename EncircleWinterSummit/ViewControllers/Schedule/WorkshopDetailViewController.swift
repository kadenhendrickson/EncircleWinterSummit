//
//  WorkshopDetailViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/23/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class WorkshopDetailViewController: UIViewController {
    
    var workshop: Workshop? 
    
    @IBOutlet weak var encircleHouseImage: UIImageView!
    @IBOutlet weak var workshopTitleLabel: UILabel!
    @IBOutlet weak var workshopTimeLabel: UILabel!
    @IBOutlet weak var workshopRoomLabel: UILabel!
    @IBOutlet weak var workshopDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews(){
        guard let workshop = workshop else {return}
        self.view.backgroundColor = .black
        encircleHouseImage.image = UIImage(named: "EncircleHouse")
        encircleHouseImage.alpha = 0.75
        workshopTitleLabel.text = workshop.title
        workshopTitleLabel.textColor = .white
        workshopTimeLabel.text = "\(workshop.time.toString())"
        workshopTimeLabel.textColor = .white
        workshopTitleLabel.textColor = .white
        workshopRoomLabel.text = "Room: \(workshop.room)"
        workshopRoomLabel.textColor = .white
        workshopDescriptionTextView.text = workshop.description
        workshopDescriptionTextView.backgroundColor = .black
        workshopDescriptionTextView.textColor = .white
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
