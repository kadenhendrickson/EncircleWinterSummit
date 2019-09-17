//
//  Workshop.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 8/8/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class Workshop {
    let name: String
    let title: String
    let time: Date
    let description: String
    let room: String
    let speakers: [Speaker]
    let map: UIImage
    
    init(name: String, title: String, time: Date, description: String, room: String, speakers: [Speaker] = [], map: UIImage) {
        self.name = name
        self.title = title
        self.time = time
        self.description = description
        self.room = room
        self.speakers = speakers
        self.map = map
    }
}
