//
//  UserController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/6/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import Foundation

class UserController {
    
    //Mark - Singleton
    static let shared = UserController()
    
    //MARK - Properties
    var currentUser: User?
    
    //MARK - CRUD Functions
    func createUser(with firstName: String, lastName: String, pronouns: Pronoun, genderIdentity: String, sexualOrientation: String, trackPreference: Track, email: String, age: String) {
        let user = User(firstName: firstName, lastName: lastName, pronouns: pronouns, genderIdentity: genderIdentity, sexualOrientation: sexualOrientation, trackPreference: trackPreference, email: email, age: age)
        
        currentUser = user
        
        resetUserSchedule(track: trackPreference)
        saveToPersistentStore()
    }
    
    func resetUserSchedule(track trackPreference: Track) {
         switch trackPreference {
         case .youth, .youngAdult:
             currentUser?.schedule = [WorkshopController.youthIntroAndOutroWorkshops[0], nil, nil, nil, nil, WorkshopController.youthIntroAndOutroWorkshops[1], WorkshopController.youthIntroAndOutroWorkshops[2]]
         default:
             currentUser?.schedule = [WorkshopController.adultIntroAndOutroWorkshops[0], nil, nil, nil, WorkshopController.adultIntroAndOutroWorkshops[1], WorkshopController.adultIntroAndOutroWorkshops[2]]
         }
        saveToPersistentStore()
     }
    
    func updateUser(with firstName: String, lastName: String, pronouns: Pronoun, genderIdentity: String, sexualOrientation: String, trackPreference: Track){
        currentUser?.firstName = firstName
        currentUser?.lastName = lastName
        currentUser?.pronouns = pronouns
        currentUser?.genderIdentity = genderIdentity
        currentUser?.sexualOrientation = sexualOrientation
        currentUser?.trackPreference = trackPreference
        saveToPersistentStore()
    }
    
    func setUserTrackPreference(track: Track){
        currentUser?.trackPreference = track
        saveToPersistentStore()
    }
    
    func addWorkshopToUserList(at index: Int, workshop: Workshop){
         currentUser?.schedule[index] = workshop
        saveToPersistentStore()
      }
      
      func removeWorkshopFromUserList(workshop: Workshop){
          guard let indexOfWorkshopToRemove = currentUser?.schedule.firstIndex(of: workshop) else {return}
          currentUser?.schedule.remove(at: indexOfWorkshopToRemove)
        saveToPersistentStore()
      }
    
    
    func fileURL() -> URL {
          let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
          let documentDirectory = paths[0]
          let filename = "encircleWinterSummit-1.json"
          let fullURL = documentDirectory.appendingPathComponent(filename)
          return fullURL
      }
      
      func saveToPersistentStore() {
          let jsonEncoder  = JSONEncoder()
          do {
            let data = try jsonEncoder.encode(currentUser)
              let url = fileURL()
              try data.write(to: url)
          } catch let e {
              print("Error my dude: \(e)")
          }
          
      }
      
      func loadFromPersistentStore() -> User? {
          let jsonDecoder = JSONDecoder()
          do{
              let url = fileURL()
              let data = try Data(contentsOf: url)
            let user = try jsonDecoder.decode(User.self, from: data)
              
              return user
          } catch let e {
              print("Error my man: \(e)")
          }
        return nil
      }
}
