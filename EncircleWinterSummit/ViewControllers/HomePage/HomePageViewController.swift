//
//  ViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 9/17/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.backgroundColor = .black
        collectionView.backgroundColor = .black
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.barTintColor = .black
    }

    func openURL(urlString: String!){
        if let url = NSURL(string: urlString), !url.absoluteString!.isEmpty {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row == 0){
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homepageHeaderCell", for: indexPath) as? HomepageHeaderCollectionViewCell else {return UICollectionViewCell()}
            cell.backgroundColor = .black
            return cell
            
        } else if(indexPath.row == 1 || indexPath.row == 2){
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "smallDetailCell", for: indexPath) as? SmallDetailCollectionViewCell else {return UICollectionViewCell()}
            let info = InfoController.information[indexPath.row-1]
                      cell.info = info
                      cell.configureCell(cell: cell)
                      cell.backgroundColor = .blue
                      return cell
        } else {
            return UICollectionViewCell()
        
      
          //put the next workshop here dummy
            
//        case 2:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homepageSessionCell", for: indexPath) as? SessionCollectionViewCell else {return UICollectionViewCell()}
//            let session = UserController.shared.currentUser?.schedule[1]
//            cell.session = session
//            cell.backgroundColor = .yellow
//            return cell
       
    }
}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.row == 1){
            self.tabBarController?.selectedIndex = 1
        }
        if(indexPath.row == 2){
            openURL(urlString: "https://encircletogether.org/dropin")
        }
    }
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.row == 0) {
            let width = collectionView.bounds.size.width
            let height = width/1.4
            return CGSize(width: width, height: height)
        }
        let width = view.frame.width-40
        return CGSize(width: width, height: width/2.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
}
