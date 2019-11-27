//
//  InfoController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/6/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import Foundation

class InfoController {
    static var information: [Info] {
        let schedule = Info(name: "THE SCHEDULE", description: "Plan  your workshops and see what else is on the schedule!")
        let resources = Info(name: "VISIT AN ENCIRCLE HOME", description: "Can't wait for the summit? Stop by an encircle home and let us know how excited you are!")
        return[schedule, resources]
    }
}
