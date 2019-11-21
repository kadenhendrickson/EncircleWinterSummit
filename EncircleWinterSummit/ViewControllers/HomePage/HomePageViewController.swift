//
//  ViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 9/17/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var welcomeTextField: UILabel!
    @IBOutlet weak var descriptionTextField: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        setUpViews()
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.backgroundColor = .black
        collectionView.backgroundColor = .black
    }
    
    
    
    func setUpViews(){
        welcomeTextField.text = "WELCOME TO ENCIRCLE SUMMIT 2019"
        descriptionTextField.text = "We're excited to have you at this years encircle summit (formerly known as IGNITE.) We're excited to see you soon!"
        welcomeTextField.textColor = .white
        descriptionTextField.textColor = .white
        
        
    }
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row < 2){
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "smallDetailCell", for: indexPath) as? SmallDetailCollectionViewCell else {return UICollectionViewCell()}
            let info = InfoController.information[indexPath.row]
                      cell.info = info
                      cell.configureCell(cell: cell)
                      cell.backgroundColor = .blue
                      return cell
        } else {
            return UICollectionViewCell()
        
      
          
            
//        case 2:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homepageSessionCell", for: indexPath) as? SessionCollectionViewCell else {return UICollectionViewCell()}
//            let session = UserController.shared.currentUser?.schedule[1]
//            cell.session = session
//            cell.backgroundColor = .yellow
//            return cell
       
    }
}
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width-50
        return CGSize(width: width, height: width/3)
    }
}
