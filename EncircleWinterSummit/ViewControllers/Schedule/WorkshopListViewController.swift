//
//  WorkshopListViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/19/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class WorkshopListViewController: UIViewController {
    
    var workshops: [Workshop]?
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
        

        // Do any additional setup after loading the view.
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

extension WorkshopListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = workshops?.count else {return 0}
        let size = count + 1
        return size
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row == 0) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workshopHeaderCell", for: indexPath) as? WorkshopHeaderCollectionViewCell else {return UICollectionViewCell()}
            
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workshopCell", for: indexPath) as? WorkshopCollectionViewCell, let workshops = workshops else {return UICollectionViewCell()}
            cell.workshop = workshops[indexPath.row-1]
            cell.backgroundColor = .white
            return cell
        }
    }
}

extension WorkshopListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.row == 0){
            let width = collectionView.bounds.width
            let height = width/2
            return CGSize(width: width, height: height)
        } else {
            return CGSize(width: 100, height: 150)
        }
        
    }
}



