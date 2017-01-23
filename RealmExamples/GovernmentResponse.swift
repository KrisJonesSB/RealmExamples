//
//  GovernmentResponse.swift
//  RealmExamples
//
//  Created by Kris Jones on 22/01/2017.
//  Copyright © 2017 NSBelfast. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class GovernmentResponse : Object {
  
  dynamic var summary: String?
  dynamic var createdAt: Date?
  dynamic var details: String?
  
  func initWith(json: JSON) {
    self.summary = json["created_at"].string
    self.details = json["details"].string
    self.createdAt = json["summary"].dateTime
  }

}
