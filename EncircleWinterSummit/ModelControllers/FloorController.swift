//
//  FloorController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/6/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class FloorController {
    
    public static var shared = FloorController()
    
    public var building: [Floor] = []
    
    //sets the building
    func setBuilding(buildingName: Building) {
        if(buildingName == .adobe) {
            self.building = adobeFloors
        } else {
            self.building = podiumFloors
        }
    }
    
    //Determines which kind of cell it should be, then sets the data on the cell
    func setCell(indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        if(indexPath.row == 0){
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mapHeaderCell", for: indexPath) as? MapHeaderCollectionViewCell else {return UICollectionViewCell()}
            let floor = building[indexPath.row]
            cell.floor = floor
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "floorCell", for: indexPath) as? FloorMapCollectionViewCell else {return UICollectionViewCell()}
            let floor = building[indexPath.row ]
            cell.floor = floor
            return cell
        }
    }
    
    var adobeFloors: [Floor] {
        let building = Floor(name: "Adobe Building", rooms: "If you're still lost, find an Encircle Volunteer who can direct you in the right direction.", map: UIImage(named: "Adobe"))
        let floor0 = Floor(name: "FLOOR 0", rooms: "1,2,3", map: UIImage(named: "Adobe-0"))
        let floor1 = Floor(name: "FLOOR 1", rooms: "Alphabravo, DaVinci, Dali, Lucas, Michelangelo, Pollock, Rodan, Spielberg", map: UIImage(named: "Adobe-1"))
        let floor2 = Floor(name: "FLOOR 2", rooms: "Burton, Pele, Ruth", map: UIImage(named: "Adobe-2"))
        let floor3 = Floor(name: "FLOOR 3", rooms: "Bell, Bohr, Gould, Music Room, Newton, Tesla, Volta", map: UIImage(named: "Adobe-3"))
        let floor4 = Floor(name: "FLOOR 4", rooms: "Cailliau, Geschke, Hoff, Miyamoto, Torvalds", map: UIImage(named: "Adobe-4"))

        return [building, floor0, floor1, floor2, floor3, floor4]
    }
    
    var podiumFloors: [Floor] {
        let building = Floor(name: "Podium Building", rooms: "If you're still lost, find an Encircle Volunteer who can direct you in the right direction.", map: UIImage(named: "Podium"))
        let floor1 = Floor(name: "FLOOR 1", rooms: "1,2,3", map: nil)
        let floor2 = Floor(name: "FLOOR 2", rooms: "1,2,3", map: nil)
        let floor3 = Floor(name: "FLOOR 3", rooms: "1,2,3", map: nil)
        let floor4 = Floor(name: "FLOOR 4", rooms: "1,2,3", map: nil)

        return [building, floor1, floor2, floor3, floor4]
    }
}
