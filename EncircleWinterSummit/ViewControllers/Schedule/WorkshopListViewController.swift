//
//  WorkshopListViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/19/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

protocol WorkshopListViewControllerDelegate: class {
    func reloadData()
}

class WorkshopListViewController: UIViewController {
    
    var workshops: [Workshop]?
    weak var delegate: WorkshopListViewControllerDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBackButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension WorkshopListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = workshops?.count else {return 0}
        let size = count + 1
        return size
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row == 0) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workshopHeaderCell", for: indexPath) as? WorkshopHeaderCollectionViewCell, let workshops = workshops else {return UICollectionViewCell()}
            cell.workshop = workshops[0]
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workshopCell", for: indexPath) as? WorkshopCollectionViewCell, let workshops = workshops else {return UICollectionViewCell()}
            cell.workshop = workshops[indexPath.row-1]
            cell.delegate = self
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
            let width = collectionView.bounds.width-40
            return CGSize(width: width, height: width/1.5)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
}

extension WorkshopListViewController: WorkshopCollectionViewCellDelegate {
    func sessionInfoButtonTapped(workshop: Workshop) {
        let storyboard = UIStoryboard(name: "Schedule", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "workshopDetailVC") as? WorkshopDetailViewController else {return}
        viewController.workshop = workshop
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    func addToScheduleButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        delegate?.reloadData()
    }
    
    
}



