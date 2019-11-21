//
//  MapsViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/12/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class MapsViewController: UIViewController {
    
    
    @IBOutlet weak var selectedFloorButton: UIButton!
    @IBOutlet var buildingButtons: [UIButton]!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .black
        view.backgroundColor = .black
        selectedFloorButton.setTitle("Adobe Building", for: .normal)
        selectedFloorButton.setTitleColor(.white, for: .normal)
        FloorController.shared.setBuilding(buildingName: .adobe)
        buildingButtons.forEach { (button) in
            button.isHidden = true
            button.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBAction func currentBuildingButtonClicked(_ sender: UIButton) {
        buildingButtons.forEach { (button) in
            if(selectedFloorButton.titleLabel?.text != button.titleLabel?.text){
                UIView.animate(withDuration: 0.3) {
                button.isHidden = !button.isHidden
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    
    @IBAction func selectBuildingButtonClicked(_ sender: UIButton) {
        selectedFloorButton.setTitle(sender.titleLabel?.text, for: .normal)
        buildingButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3) {
                button.isHidden = true
            }
        }
        guard let building = sender.titleLabel?.text else {return}
        if(building == Building.adobe.rawValue) {
            FloorController.shared.setBuilding(buildingName: .adobe)
            selectedFloorButton.backgroundColor = .red
        } else {
            FloorController.shared.setBuilding(buildingName: .podium)
            selectedFloorButton.backgroundColor = .blue
        }
        collectionView.reloadData()
    }
    
}

extension MapsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FloorController.shared.building.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row == 0){
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mapHeaderCell", for: indexPath) as? MapHeaderCollectionViewCell else {return UICollectionViewCell()}
            let floor = FloorController.shared.building[indexPath.row]
            cell.floor = floor
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "floorCell", for: indexPath) as? FloorMapCollectionViewCell else {return UICollectionViewCell()}
            let floor = FloorController.shared.building[indexPath.row]
            cell.delegate = self
            cell.backgroundColor = .white
            cell.floor = floor
            return cell
        }
    }
}


extension MapsViewController: UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           if(indexPath.row == 0) {
               let width = collectionView.bounds.size.width
            let height = width/2
               return CGSize(width: width, height: height)
           }
           let width = view.frame.width-40
        return CGSize(width: width, height: width/1.5 )
       }
}

extension MapsViewController: FloorMapCollectionViewCellDelegate {
    func viewMapButtonTapped(floor: Floor) {
        let storyboard = UIStoryboard(name: "Maps", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "floorDetailVC") as? FloorDetailViewController else {return}
        viewController.floor = floor
        self.present(viewController, animated: true)
    }
    
    
}
