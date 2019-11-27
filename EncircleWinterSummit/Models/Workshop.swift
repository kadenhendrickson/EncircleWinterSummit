//
//  Workshop.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 8/8/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class Workshop: Codable {
    let name: String //WorkshopNumber
    let title: String
    let time: Date
    let description: String
    let room: String
    let map: String
    
    init(name: String, title: String, time: Date, description: String, room: String, map: String) {
        self.name = name
        self.title = title
        self.time = time
        self.description = description
        self.room = room
        self.map = map
    }
}

extension Workshop: Equatable {
    static func == (lhs: Workshop, rhs: Workshop) -> Bool {
        return(lhs.title == rhs.title && lhs.time == rhs.time && lhs.description == rhs.description && lhs.name == rhs.name)
    }
    
    
}
