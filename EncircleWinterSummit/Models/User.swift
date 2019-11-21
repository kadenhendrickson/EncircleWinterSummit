//
//  User.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 8/8/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import Foundation

class User: Codable {

    var firstName: String
    var lastName: String
    var pronouns: Pronoun
    var genderIdentity: String
    var sexualOrientation: String
    var trackPreference: Track
    var schedule: [Workshop?]
    
    init(firstName: String, lastName: String, pronouns: Pronoun, genderIdentity: String, sexualOrientation: String, trackPreference: Track,  schedule: [Workshop] = []) {
        self.firstName = firstName
        self.lastName = lastName
        self.pronouns = pronouns
        self.genderIdentity = genderIdentity
        self.sexualOrientation = sexualOrientation
        self.trackPreference = trackPreference
        self.schedule = schedule
    }
}

enum Pronoun: String, Codable {
    case they = "They/Them"
    case he = "He/Him/His"
    case she = "She/Her/Hers"
}

enum Track: String, Codable {
    case youth = "Youth Track"
    case youngAdult = "Young Adult Track"
    case adult = "Adult Track"
    case parent = "Parent/Ally Track"
    case educator = "Educator Track"
}
