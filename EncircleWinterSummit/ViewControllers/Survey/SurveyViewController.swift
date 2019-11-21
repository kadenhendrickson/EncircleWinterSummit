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

        titleLabel.text = "Surveys"
        titleLabel.textColor =  .white
        titleLabel.font = UIFont(name: FontNames.playfairBold, size: 40)
        messageLabel.text = "We'd love to know what you thought about the programs, workshops, and the summit in general."

        messageLabel.textColor = .white
        messageLabel.font = UIFont(name: FontNames.futuraBook, size: 12)
        takeQuizButton.setTitle("Take the quiz now!", for: .normal)
        self.view.backgroundColor = .black
        encircleHouseImage.image = UIImage(named: "EncircleHouse")
    }
    
    
    @IBAction func takeQuizButtonTapped(_ sender: Any) {
        openURL(urlString: "https://stackoverflow.com/questions/39392939/how-to-add-a-hyperlink-button-on-ios-swift")
    }
    
    func openURL(urlString: String!){
        if let url = NSURL(string: urlString), !url.absoluteString!.isEmpty {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
