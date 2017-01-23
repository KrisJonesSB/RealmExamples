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
  
  func loadPetitionsTo(realm: Realm) {
    
    let petitionJson = loadPetitionsFromJson()
    if let petitionData = petitionJson?["data"].array {
      
      realm.beginWrite()
      
      for petitionJson in petitionData {
        let petition = Petition()
        petition.initWith(json: petitionJson)
        // Create petiton OR update if the PK exists
        realm.add(petition, update: true)
      }
      
      try! realm.commitWrite()
    }
  }
  
  func getAllPetitions(realm: Realm) -> Results<Petition>? {
    return realm.objects(Petition.self)
  }
  
  func getPetitionsWith(state: String, realm: Realm) -> Results<Petition>? {
    return realm.objects(Petition.self).filter("petitionState == \(state)")
  }
  
  func getPetitionsOrder(sortKey: String, realm: Realm) -> Results<Petition>? {
    return realm.objects(Petition.self).sorted(byProperty: "\(sortKey)")
  }
  
  // Mock data returned from network
  private func loadPetitionsFromJson() -> JSON? {
    
    if let path = Bundle.main.path(forResource: "petitions", ofType: "json") {
      
      do {
        
        let jsonData = try NSData(contentsOfFile: path, options: .mappedIfSafe)
        
        if let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
          
          // Serialised JSON Data
          let petitionJson = JSON(jsonResult)
          return petitionJson
        }
        
      } catch {
        print("Error")
      }
    }
    
    return nil
  }
  
}
