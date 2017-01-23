//
//  PetitionManager.swift
//  RealmExamples
//
//  Created by Kris Jones on 22/01/2017.
//  Copyright © 2017 NSBelfast. All rights reserved.
//

import Foundation
import RealmSwift

class PetitionManager {
  
  func getPetitions()  {
    
    if let path = Bundle.main.path(forResource: "petitions", ofType: "json") {
      
      do {
        
        let jsonData = try NSData(contentsOfFile: path, options: .mappedIfSafe)
        
        if let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
          
          // Serialised JSON Data
          
          print(jsonResult)
          
        }
        
      } catch {
        print("Error")
      }
    }
    
    
  }
  
}
