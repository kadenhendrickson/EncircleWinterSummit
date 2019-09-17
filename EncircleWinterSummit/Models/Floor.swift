//
//  Floor.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 8/8/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class Floor {
    let name: String
    let rooms: [String]
    let map: UIImage
    
    init(name: String, rooms: [String], map: UIImage) {
        self.name = name
        self.rooms = rooms
        self.map = map
    }
}
