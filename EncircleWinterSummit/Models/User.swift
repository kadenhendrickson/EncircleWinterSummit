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
    var email: String
    var age: String
    var schedule: [Workshop?]
    var userID: String
    
    init(firstName: String, lastName: String, pronouns: Pronoun, genderIdentity: String, sexualOrientation: String, trackPreference: Track, email: String, age: String,  schedule: [Workshop] = [], userID: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.pronouns = pronouns
        self.genderIdentity = genderIdentity
        self.sexualOrientation = sexualOrientation
        self.trackPreference = trackPreference
        self.schedule = schedule
        self.email = email
        self.age = age
        self.userID = userID
    }
    
    var dictionaryRepresentation: [String: Any] {
        return ["firstName" : firstName,
                "lastName" : lastName,
                "pronouns" : pronouns.rawValue,
                "genderIdentity" : genderIdentity,
                "sexualOrientation" : sexualOrientation,
                "trackPreference" : trackPreference.rawValue,
                "email" : email,
                "age" : age,
                "workshops" : []]
    }
    
}

enum Pronoun: String, Codable {
    case they = "They/Them"
    case he = "He/Him/His"
    case she = "She/Her/Hers"
    case other = "Other"
}

enum Track: String, Codable {
    case youth = "Youth Track"
    case youngAdult = "Young Adult Track"
    case adult = "Adult Track"
    case parent = "Parent/Ally Track"
    case educator = "Educator Track"
}
