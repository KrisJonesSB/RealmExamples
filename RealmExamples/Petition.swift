//
//  HistoricEvent.swift
//  RealmExamples
//
//  Created by Kris Jones on 22/01/2017.
//  Copyright © 2017 NSBelfast. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Petition : Object {
  
  
  dynamic var petitionId = 0
  dynamic var action: String?
  dynamic var background: String?
  dynamic var state: String?
  dynamic var signatureCount = 0
  dynamic var createdAt: Date?
  dynamic var closedAt: Date?
  dynamic var creatorName: String?
  dynamic var governmentResponse: GovernmentResponse?
  dynamic var signed = 0
  
  func initWith(json: JSON) {
    
    self.petitionId = json["id"].int ?? 0
    self.action = json["attributes"]["action"].string
    self.creatorName = json["attributes"]["creator_name"].string
    self.state = json["attributes"]["state"].string
    self.background = json["attributes"]["background"].string
    self.createdAt = json["attributes"]["created_at"].dateTime
    self.closedAt = json["attributes"]["closed_at"].dateTime
    self.signatureCount = json["attributes"]["signature_count"].int ?? 0
    
    if let _ = json["attributes"]["government_response"].dictionary {
      let governmentResponse = GovernmentResponse()
      governmentResponse.initWith(json: json["attributes"]["government_response"])
      self.governmentResponse = governmentResponse
    }
  }

}
