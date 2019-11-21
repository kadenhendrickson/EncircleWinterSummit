//
//  Floor.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 8/8/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class Floor: Equatable {
   
    let name: String
    let rooms: String
    let map: UIImage?
    
    init(name: String, rooms: String, map: UIImage?) {
        self.name = name
        self.rooms = rooms
        self.map = map
    }
    
    static func == (lhs: Floor, rhs: Floor) -> Bool {
           return lhs.name == rhs.name && lhs.rooms == lhs.rooms && lhs.map == rhs.map
       }
       
}

enum Building: String, Codable {
       case adobe = "Adobe Building"
       case podium = "Podium Building"
   }
