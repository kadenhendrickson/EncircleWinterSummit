//
//  Session.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 8/8/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import Foundation

class Session {
    let name: String
    let time: Date
    var workshops: [Workshop]
    
    init(name: String, time: Date, workshops: [Workshop]) {
        self.name = name
        self.time = time
        self.workshops = workshops
    }
}
