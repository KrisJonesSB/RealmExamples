//
//  Helpers.swift
//  RealmExamples
//
//  Created by Kris Jones on 22/01/2017.
//  Copyright © 2017 NSBelfast. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
  
  public var date: Date? {
    get {
      switch self.type {
      case .string:
        return Formatter.jsonDateFormatter.date(from: self.object as! String)
      default:
        return nil
      }
    }
  }
  
  public var dateTime: Date? {
    get {
      switch self.type {
      case .string:
        return Formatter.jsonDateTimeFormatter.date(from: self.object as! String)
      default:
        return nil
      }
    }
  }
  
}


class Formatter {
  
  fileprivate static var internalJsonDateFormatter: DateFormatter?
  fileprivate static var internalJsonDateTimeFormatter: DateFormatter?
  
  static var jsonDateFormatter: DateFormatter {
    if (internalJsonDateFormatter == nil) {
      internalJsonDateFormatter = DateFormatter()
      internalJsonDateFormatter!.dateFormat = "yyyy-MM-dd"
    }
    return internalJsonDateFormatter!
  }
  
  static var jsonDateTimeFormatter: DateFormatter {
    if (internalJsonDateTimeFormatter == nil) {
      internalJsonDateTimeFormatter = DateFormatter()
      internalJsonDateTimeFormatter!.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"
    }
    return internalJsonDateTimeFormatter!
  }
  
}
