//
//  UserController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/6/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import Foundation
import Firebase

class UserController {
    
    //Mark - Singleton
    static let shared = UserController()
    
    //MARK - Properties
    var currentUser: User?
    lazy var db = Firestore.firestore()
    
    //MARK - CRUD Functions
    func createUser(with firstName: String, lastName: String, pronouns: Pronoun, genderIdentity: String, sexualOrientation: String, trackPreference: Track, email: String, age: String) {
        let user = User(firstName: firstName, lastName: lastName, pronouns: pronouns, genderIdentity: genderIdentity, sexualOrientation: sexualOrientation, trackPreference: trackPreference, email: email, age: age, userID: UUID().uuidString)
        
        currentUser = user
        resetUserSchedule(track: trackPreference)
        saveToPersistentStore()
        
        //Create the User in Firestore
        let userRef = db.collection("Users")
        let userDictionary = user.dictionaryRepresentation
        userRef.document(user.userID).setData(userDictionary) { (error) in
            if(error != nil){
                print(error?.localizedDescription)
            }
        }
        
    }
    
    func resetUserSchedule(track trackPreference: Track) {
        guard let currentUser = currentUser else {return}
         switch trackPreference {
         case .youth, .youngAdult:
            currentUser.schedule = [WorkshopController.shared.youthIntroAndOutroWorkshops[0], WorkshopController.shared.youthIntroAndOutroWorkshops[1], nil, nil, nil, WorkshopController.shared.youthIntroAndOutroWorkshops[2], WorkshopController.shared.youthIntroAndOutroWorkshops[3]]
         default:
            currentUser.schedule = [WorkshopController.shared.adultIntroAndOutroWorkshops[0], nil, nil, nil, WorkshopController.shared.adultIntroAndOutroWorkshops[1], WorkshopController.shared.adultIntroAndOutroWorkshops[2]]
         }
        db.collection("Users").document(currentUser.userID).updateData(["workshops" : FieldValue.delete()])
        saveToPersistentStore()
     }
    
    func updateUser(with firstName: String, lastName: String, pronouns: Pronoun, genderIdentity: String, sexualOrientation: String, trackPreference: Track){
        guard let currentUser = currentUser else {return}
        currentUser.firstName = firstName
        currentUser.lastName = lastName
        currentUser.pronouns = pronouns
        currentUser.genderIdentity = genderIdentity
        currentUser.sexualOrientation = sexualOrientation
        currentUser.trackPreference = trackPreference
        
        let userDictionary = currentUser.dictionaryRepresentation
        db.collection("Users").document(currentUser.userID).updateData(userDictionary)
        saveToPersistentStore()
    }
    
    func setUserTrackPreference(track: Track){
        guard let currentUser = currentUser else {return}
        currentUser.trackPreference = track

        db.collection("Users").document(currentUser.userID).updateData(["trackPreference" : track.rawValue])
        
        saveToPersistentStore()
    }
    
    func addWorkshopToUserList(at index: Int, workshop: Workshop){
        guard let currentUser = currentUser else {return}
         currentUser.schedule[index] = workshop
        db.collection("Users").document(currentUser.userID).updateData(["workshops" : FieldValue.arrayUnion([workshop.title])])
        saveToPersistentStore()
      }
      
      func removeWorkshopFromUserList(workshop: Workshop){
          guard let indexOfWorkshopToRemove = currentUser?.schedule.firstIndex(of: workshop), let currentUser = currentUser else {return}
          currentUser.schedule.remove(at: indexOfWorkshopToRemove)
        //work on this
//        db.collection("Users").document(currentUser.userID).updateData(["workshops" : FieldValue.delete()])
        
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
