//
//  SurveyViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/11/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var takeQuizButton: UIButton!
    @IBOutlet weak var encircleHouseImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        titleLabel.text = "Surveys"
        messageLabel.text = "We'd love to know what you thought about the programs, workshops, and the summit in general."
        takeQuizButton.setTitle("GIVE US SOME FEEDBACK!", for: .normal)
        takeQuizButton.titleLabel?.font = UIFont(name: FontNames.futuraBook, size: 14)
        takeQuizButton.setTitleColor(.gray, for: .selected)
        encircleHouseImage.image = UIImage(named: "EncircleHouse")
        encircleHouseImage.alpha = 0.75
        takeQuizButton.backgroundColor = .white
        takeQuizButton.setTitleColor(.black, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
          tabBarController?.tabBar.barTintColor = .black
      }
    
    @IBAction func takeQuizButtonTapped(_ sender: Any) {
        openURL(urlString: "https://encircletogether.org/summitsurvey")
    }
    
    func openURL(urlString: String!){
        if let url = NSURL(string: urlString), !url.absoluteString!.isEmpty {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
}
