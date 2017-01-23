//
//  PetitionManager.swift
//  RealmExamples
//
//  Created by Kris Jones on 22/01/2017.
//  Copyright © 2017 NSBelfast. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

public class PetitionManager {
  
  func loadPetitions(realm: Realm) {
    
    if let path = Bundle.main.path(forResource: "petitions", ofType: "json") {
      
      do {
        
        let jsonData = try NSData(contentsOfFile: path, options: .mappedIfSafe)
        
        if let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
          
          // Serialised JSON Data
          let petitionJson = JSON(jsonResult)
          
          if let petitionData = petitionJson["data"].array {
            
            realm.beginWrite()
            
            for petitionJson in petitionData {
              let petition = Petition()
              petition.initWith(json: petitionJson)
              realm.add(petition)
            }
            
            try! realm.commitWrite()
          }
        }
        
      } catch {
        print("Error")
      }
    }
  }
  
    func getAllPetitions(realm: Realm) -> Results<Petition>? {
      
      let allStoredPetitions = realm.objects(Petition.self)
      return allStoredPetitions
  }
  
}
